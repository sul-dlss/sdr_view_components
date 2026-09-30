import { Controller } from '@hotwired/stimulus'

// Moves tabs that don't fit on a single row into a trailing "More" dropdown tab (see
// TabListComponent's `overflow_menu` option). The tab list is laid out again whenever
// its width changes.
//
// The tab list is excluded from Turbo morphs (e.g., page refreshes): morphing would move the
// tabs back to their server-rendered positions, close an open "More" menu, and replace the
// menu element out from under Bootstrap's Dropdown instance.
export default class extends Controller {
  static targets = ['more', 'menu']

  connect () {
    this.resizeObserver = new window.ResizeObserver(() => {
      if (this.element.offsetWidth === this.lastWidth) return

      this.lastWidth = this.element.offsetWidth
      this.layout()
    })
    this.resizeObserver.observe(this.element)
    document.fonts?.ready.then(this.layout)
  }

  disconnect () {
    this.resizeObserver.disconnect()
  }

  layout = () => {
    this.restore()
    const items = this.tabItems()
    // Hidden (e.g., collapsed into a select) or everything fits on one row.
    if (this.element.offsetWidth === 0 || items.length === 0) return
    if (!this.isWrapped(items.at(-1), items[0])) return

    this.moreTarget.classList.remove('d-none')
    while (items.length > 1 && this.isWrapped(this.moreTarget, items[0])) {
      this.overflow(items.pop())
    }
    this.syncMoreActive()
  }

  syncMoreActive = () => {
    const toggle = this.moreTarget.querySelector('.dropdown-toggle')
    toggle.classList.toggle('active', this.menuTarget.querySelector('.active') !== null)
  }

  preventMorph (event) {
    if (event.target === this.element) event.preventDefault()
  }

  // Moves all tabs back into the tab list (in their original order) and hides "More".
  restore () {
    this.tabItems().forEach((item) => {
      if (item.parentElement === this.element) return

      this.element.insertBefore(item, this.moreTarget)
      item.querySelector('[role="tab"]').classList.replace('dropdown-item', 'nav-link')
    })
    this.moreTarget.classList.add('d-none')
    this.syncMoreActive()
  }

  overflow (item) {
    this.menuTarget.prepend(item)
    item.querySelector('[role="tab"]').classList.replace('nav-link', 'dropdown-item')
  }

  // The tab <li>s, in document order (tab list first, then the "More" menu).
  tabItems () {
    return Array.from(this.element.querySelectorAll('[role="tab"]'), (tab) => tab.closest('li'))
  }

  isWrapped (item, firstItem) {
    return item.offsetTop > firstItem.offsetTop
  }
}
