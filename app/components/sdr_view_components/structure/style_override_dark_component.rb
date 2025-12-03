# frozen_string_literal: true

module SdrViewComponents
  module Structure
    # Component for rendering page header.
    class StyleOverrideDarkComponent < BaseComponent
      def initialize(background_color:)
        @background_color = background_color
        super()
      end

      attr_reader :background_color

      private

      def render?
        background_color.present?
      end
    end
  end
end
