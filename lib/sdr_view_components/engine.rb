# frozen_string_literal: true

require 'view_component'

module SdrViewComponents
  # Engine class for the SDR View Components gem
  class Engine < ::Rails::Engine
    isolate_namespace SdrViewComponents

    initializer 'sdr_view_components.preview_autoload', before: :set_autoload_paths do |app|
      preview_path = root.join('spec/components/previews').to_s
      app.config.autoload_paths |= [preview_path]
    end

    initializer 'sdr_view_components.preview_paths' do |app|
      preview_path = root.join('spec/components/previews').to_s

      app.config.view_component.previews.paths |= [preview_path] if app.config.view_component.respond_to?(:previews)

      # Lookbook direct config
      if app.config.respond_to?(:lookbook) && app.config.lookbook.respond_to?(:preview_paths)
        app.config.lookbook.preview_paths |= [preview_path]
      end
    end

    initializer 'sdr_view_components.assets' do |app|
      app.config.assets.paths << Engine.root.join('app', 'assets').to_s
      app.config.assets.paths << Engine.root.join('app', 'assets', 'stylesheets').to_s
      app.config.assets.paths << Engine.root.join('app', 'javascript').to_s
    end

    initializer 'sdr_view_components.helpers' do
      ActiveSupport.on_load(:action_view) do
        include SdrViewComponents::Helpers
      end
    end

    initializer 'sdr_view_components.configure_lookbook' do
      config.view_component.previews.default_layout = 'lookbook'
    end
  end
end
