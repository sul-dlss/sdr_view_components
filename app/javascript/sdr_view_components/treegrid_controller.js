import { Controller } from "@hotwired/stimulus"

// Expanded state of the folders that users have toggled, by table id then folder key, kept across renders.
const expandedByTable = new Map()

// Expands and collapses the folder rows of a treegrid table (TreegridTableComponent),
// with keyboard navigation per https://www.w3.org/WAI/ARIA/apg/patterns/treegrid/
// Only one row (the last focused) is in the tab order.
export default class extends Controller {
  static targets = ["fileAction"]
  static values = { rememberExpanded: Boolean }

  connect() {
    if (this.rememberExpandedValue) this.restoreExpanded()
    this.element.addEventListener("focusin", this.focusRow)
    this.setTabbableRow(this.visibleRows()[0])
  }

  disconnect() {
    this.element.removeEventListener("focusin", this.focusRow)
  }

  focusRow = (event) => {
    if (this.isTreeRow(event.target)) this.setTabbableRow(event.target)
  }

  setTabbableRow(row) {
    if (!row) return

    this.element.querySelectorAll(':scope > tbody > tr[tabindex="0"]').forEach((other) => { other.tabIndex = -1 })
    row.tabIndex = 0
  }

  toggle(event) {
    this.toggleFolder(event.target.closest("tr"))
  }

  expandAll(event) {
    event.preventDefault()
    this.folderRows().forEach((row) => {
      if (!this.isOpenFolder(row)) this.toggleFolder(row)
    })
  }

  collapseAll(event) {
    event.preventDefault()
    this.folderRows().forEach((row) => {
      if (this.isOpenFolder(row)) this.toggleFolder(row)
    })
  }

  navigate(event) {
    const row = event.target
    if (!this.isTreeRow(row)) return

    const target = this.navigationTarget(event.key, row)
    if (target === undefined) return

    event.preventDefault()
    if (typeof target === "function") {
      target()
    } else {
      target?.focus()
    }
  }

  // @return [Function, Element, null, undefined] an action or the row to focus; undefined if the key isn't handled
  navigationTarget(key, row) {
    switch (key) {
      case "Enter":
        if (this.isFolder(row)) return () => this.toggleFolder(row)
        return this.fileAction(row) ? () => this.fileAction(row).click() : undefined
      case "ArrowRight":
        if (!this.isFolder(row)) return undefined
        return this.isOpenFolder(row) ? this.nextVisibleRow(row) : () => this.toggleFolder(row)
      case "ArrowLeft":
        if (this.isOpenFolder(row)) return () => this.toggleFolder(row)
        return this.level(row) > 1 ? this.parentRow(row) : undefined
      case "ArrowUp":
        return this.previousVisibleRow(row)
      case "ArrowDown":
        return this.nextVisibleRow(row)
      case "Home":
        return this.visibleRows()[0]
      case "End":
        return this.visibleRows().at(-1)
      default:
        return undefined
    }
  }

  toggleFolder(row) {
    const expand = !this.isOpenFolder(row)
    row.setAttribute("aria-expanded", expand)
    if (this.rememberExpandedValue) this.expandedFolders().set(row.dataset.sdrTreegridKey, expand)

    if (expand) {
      this.showDescendantRows(row)
    } else {
      const descendants = this.descendantRows(row)
      descendants.forEach((descendant) => { descendant.hidden = true })
      // Keeps a row in the tab order when the tabbable row is hidden.
      if (descendants.some((descendant) => descendant.tabIndex === 0)) this.setTabbableRow(row)
    }
  }

  // Shows the descendants of an expanded folder, except those within collapsed subfolders.
  showDescendantRows(row) {
    let collapsedLevel = null
    this.descendantRows(row).forEach((descendant) => {
      if (collapsedLevel !== null && this.level(descendant) > collapsedLevel) return

      descendant.hidden = false
      collapsedLevel = this.isFolder(descendant) && !this.isOpenFolder(descendant) ? this.level(descendant) : null
    })
  }

  // Rows are in tree order, so a folder within a collapsed folder is only marked expanded.
  restoreExpanded() {
    this.folderRows().forEach((row) => {
      const expanded = this.expandedFolders().get(row.dataset.sdrTreegridKey)
      if (expanded === undefined || expanded === this.isOpenFolder(row)) return

      if (expanded && row.hidden) {
        row.setAttribute("aria-expanded", true)
      } else {
        this.toggleFolder(row)
      }
    })
  }

  expandedFolders() {
    if (!expandedByTable.has(this.element.id)) expandedByTable.set(this.element.id, new Map())
    return expandedByTable.get(this.element.id)
  }

  descendantRows(row) {
    const descendants = []
    let sibling = row.nextElementSibling
    while (sibling && this.isTreeRow(sibling) && this.level(sibling) > this.level(row)) {
      descendants.push(sibling)
      sibling = sibling.nextElementSibling
    }
    return descendants
  }

  parentRow(row) {
    let sibling = row.previousElementSibling
    while (sibling && this.isTreeRow(sibling)) {
      if (this.level(sibling) === this.level(row) - 1) return sibling
      sibling = sibling.previousElementSibling
    }
    return null
  }

  nextVisibleRow(row) {
    const rows = this.visibleRows()
    return rows[rows.indexOf(row) + 1] || null
  }

  previousVisibleRow(row) {
    const rows = this.visibleRows()
    return rows[rows.indexOf(row) - 1] || null
  }

  visibleRows() {
    return Array.from(this.element.querySelectorAll(":scope > tbody > tr[aria-level]:not([hidden])"))
  }

  folderRows() {
    return this.element.querySelectorAll(':scope > tbody > tr[data-sdr-treegrid-role="folder"]')
  }

  fileAction(row) {
    return this.fileActionTargets.find((target) => row.contains(target))
  }

  isTreeRow(element) {
    return element.matches("tr[aria-level]")
  }

  isFolder(row) {
    return row.dataset.sdrTreegridRole === "folder"
  }

  isOpenFolder(row) {
    return this.isFolder(row) && row.getAttribute("aria-expanded") === "true"
  }

  level(row) {
    return Number(row.getAttribute("aria-level"))
  }
}
