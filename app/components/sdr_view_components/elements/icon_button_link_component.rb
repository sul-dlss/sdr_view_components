# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a button which is an icon
    class IconButtonLinkComponent < BaseComponent
      def initialize(icon:, label:, classes: [], icon_classes: [], link: nil, **options) # rubocop:disable Metrics/ParameterLists
        @icon = icon
        @label = label
        @classes = classes
        @link = link
        @options = options
        @icon_classes = icon_classes
        super()
      end

      attr_reader :label, :link, :options

      def classes
        merge_classes(%w[border border-0], @classes)
      end

      def button_icon
        helpers.public_send(:"#{@icon}_icon", classes: @icon_classes)
      end
    end
  end
end
