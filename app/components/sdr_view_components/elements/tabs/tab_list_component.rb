# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Tabs
      # Component for rendering a list of tabs in a tabbed interface.
      class TabListComponent < BaseComponent
        renders_one :header # optional
        renders_many :tabs, Elements::Tabs::TabComponent
        renders_many :panes, Elements::Tabs::PaneComponent

        def initialize(classes: [], variant: :default)
          @classes = classes
          @variant = variant

          raise ArgumentError, "Invalid variant: #{variant}" unless %i[underline default].include?(variant)

          super()
        end

        def classes
          merge_classes('nav', @classes, variant_classes)
        end

        private

        def variant_classes
          'nav-underline' if @variant == :underline
        end
      end
    end
  end
end
