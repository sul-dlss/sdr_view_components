# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a button which is an icon
    class IconButtonLinkComponent < BaseComponent
      include ComponentSupport::IconButtonSupport

      def initialize(icon:, label:, variant: :'outline-primary', classes: [], icon_classes: [], link: nil, # rubocop:disable Metrics/ParameterLists
                     disabled: false, **options)
        @icon = icon
        @label = label
        @variant = variant
        @classes = classes
        @link = link
        @options = options
        @icon_classes = icon_classes
        @disabled = disabled
        super()
      end

      attr_reader :label, :variant, :link, :options, :disabled

      def classes
        merge_classes(%w[icon-button border border-0], @classes)
      end
    end
  end
end
