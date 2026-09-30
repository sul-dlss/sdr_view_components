// Registers the gem's Stimulus controllers for Lookbook previews (see layouts/lookbook.html.erb).
import * as bootstrap from 'bootstrap'
import { Application } from '@hotwired/stimulus'
import TabErrorController from RAILS_ASSET_URL('./tab_error_controller.js')
import TabLinkController from RAILS_ASSET_URL('./tab_link_controller.js')
import TabNavController from RAILS_ASSET_URL('./tab_nav_controller.js')
import TabOverflowController from RAILS_ASSET_URL('./tab_overflow_controller.js')
import TabSelectController from RAILS_ASSET_URL('./tab_select_controller.js')
import ToastController from RAILS_ASSET_URL('./toast_controller.js')

// Previews' inline scripts use the global (e.g., to initialize tooltips).
window.bootstrap = bootstrap

const application = Application.start()
application.register('sdr-tab-error', TabErrorController)
application.register('sdr-tab-link', TabLinkController)
application.register('sdr-tab-nav', TabNavController)
application.register('sdr-tab-overflow', TabOverflowController)
application.register('sdr-tab-select', TabSelectController)
application.register('sdr-toast', ToastController)
