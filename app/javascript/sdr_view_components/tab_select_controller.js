import { Controller } from '@hotwired/stimulus'

// Drives a <select> that stands in for a tab list on narrow viewports (see
// TabListComponent's `collapse_below` option). Selecting an option shows the
// corresponding tab; activating a tab some other way (e.g. clicking the tab
// list above the collapse breakpoint) keeps the select's value in sync.
//
// The select is excluded from Turbo morphs (e.g., page refreshes), which would otherwise reset
// its value to the server-rendered selected option regardless of which tab is active.
//
// Uses window.bootstrap rather than `import * as bootstrap from 'bootstrap'`:
// the UMD bootstrap.bundle.min.js has no ES module exports, so an ESM import
// of it resolves to an empty namespace object even though the script itself
// still assigns the real API to window.bootstrap as a side effect.
export default class extends Controller {
  static targets = ['select']

  change (event) {
    window.bootstrap.Tab.getOrCreateInstance(document.getElementById(event.target.value)).show()
  }

  sync (event) {
    this.selectTarget.value = event.target.id
  }

  preventMorph (event) {
    if (event.target === this.selectTarget) event.preventDefault()
  }
}
