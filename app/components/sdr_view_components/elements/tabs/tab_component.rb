# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Tabs
      # Component for rendering a tab in a tabbed interface.
      class TabComponent < BaseComponent
        def initialize(label:, id:, pane_id:, active: false, variant: :underline)
          @label = label
          @id = id
          @pane_id = pane_id
          @active = active
          @variant = variant

          raise ArgumentError, "Invalid variant: #{variant}" unless %i[underline default].include?(variant)

          super()
        end

        attr_reader :label, :id, :pane_id, :variant

        def active?
          @active
        end

        def classes
          merge_classes('nav', variant_classes)
        end

        def button_classes
          merge_classes('nav-link', active? ? 'active' : nil)
        end

        private

        def variant_classes
          'nav-underline' if variant == :underline
        end
      end
    end
  end
end
