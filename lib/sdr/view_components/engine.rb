require "view_component"

module Sdr
  module ViewComponents
    class Engine < ::Rails::Engine
      isolate_namespace Sdr::ViewComponents

        initializer "sdr-view_components.assets.precompile" do |app|
          app.config.assets.precompile += %w[ sdr-view_components_manifest.js sdr-view_components_manifest.css ]
        end

        initializer "sdr-view_components.assets" do |app|
          app.config.assets.paths << Engine.root.join("app", "assets", "stylesheets")
        end
    end
  end
end
