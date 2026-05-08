# frozen_string_literal: true

Rails.application.configure do
  config.lookbook.project_name = 'SDR View Components'
  config.lookbook.preview_paths << SdrViewComponents::Engine.root.join('spec/components/previews')
  config.lookbook.listen_paths << SdrViewComponents::Engine.root.join('app/components')
  config.lookbook.preview_layout = 'application'
  config.lookbook.live_updates = false
end
