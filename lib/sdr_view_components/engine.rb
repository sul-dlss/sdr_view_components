# frozen_string_literal: true

require 'view_component'

module SdrViewComponents
  # Engine class for the SDR View Components gem
  class Engine < ::Rails::Engine
    isolate_namespace SdrViewComponents

    initializer 'sdr_view_components.view_component' do
      require 'view_component/engine'

      # Tell VC where your previews live (inside the engine)
      config.view_component.previews.paths << root.join('spec/components/previews')

      # Optional: which layout to wrap previews in (comes from the dummy app)
      config.view_component.default_preview_layout = 'application'
    end

    initializer 'sdr_view_components.assets' do |app|
      app.config.assets.paths << Engine.root.join('app', 'assets', 'stylesheets').to_s
      app.config.assets.precompile += %w[sdr_view_components.css]
    end

    initializer 'sdr_view_components.helpers' do
      ActiveSupport.on_load(:action_view) do
        include SdrViewComponents::Helpers
      end
    end
  end
end
