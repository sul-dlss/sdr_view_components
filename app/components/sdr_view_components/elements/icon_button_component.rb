# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a button which is an icon
    class IconButtonComponent < BaseComponent
      def initialize(icon:, label:, classes: [], **options)
        @icon = icon
        @label = label
        @classes = classes
        @options = options
        super()
      end

      def before_render
        raise SdrViewComponents::Error::UnknownComponentIcon, "Unknown icon type: #{@icon}" unless button_icon?
      end

      attr_reader :label, :options

      def classes
        merge_classes(%w[border border-0], @classes)
      end

      def button_icon
        helpers.public_send(:"#{@icon}_icon")
      end

      private

      def button_icon?
        helpers.respond_to?(:"#{@icon}_icon")
      end
    end
  end
end
