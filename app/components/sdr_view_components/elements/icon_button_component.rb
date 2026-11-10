# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a button which is an icon
    class IconButtonComponent < BaseComponent
      include ComponentSupport::IconButtonSupport

      def initialize(icon:, label:, variant: :'outline-primary', classes: [], icon_classes: [], disabled: false, **options) # rubocop:disable Metrics/ParameterLists
        @icon = icon
        @label = label
        @variant = variant
        @classes = classes
        @icon_classes = icon_classes
        @disabled = disabled
        @options = options
        super()
      end

      attr_reader :label, :variant, :options, :disabled

      def classes
        merge_classes(%w[icon-button border border-0], @classes)
      end
    end
  end
end
