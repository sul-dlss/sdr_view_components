import { Controller } from '@hotwired/stimulus'
import * as bootstrap from 'bootstrap'

export default class extends Controller {
  static values = { tabId: String }

  showNext (event) {
    event.preventDefault()

    this.show(this.currentTab.nextElementSibling)
  }

  showPrevious (event) {
    event.preventDefault()

    this.show(this.currentTab.previousElementSibling)
  }

  // The clicked button is in the pane being hidden, so move focus to the shown tab and,
  // if the user has scrolled past the tab list (e.g., on a short screen), scroll back to it.
  show (tab) {
    bootstrap.Tab.getOrCreateInstance(tab).show()
    tab.focus({ preventScroll: true })

    const tabList = tab.closest('[role~="tablist"]')
    if (tabList.getBoundingClientRect().top < 0) tabList.scrollIntoView({ block: 'start' })
  }

  get currentTab () {
    return document.querySelector(`#${this.tabIdValue}`)
  }
}
