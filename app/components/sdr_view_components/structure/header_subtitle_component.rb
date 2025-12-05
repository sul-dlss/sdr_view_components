# frozen_string_literal: true

module SdrViewComponents
  module Structure
    # Component for rendering page header subtitle.
    class HeaderSubtitleComponent < BaseComponent
      # param subtitle [String] Subtitle text.
      def initialize(subtitle:)
        @subtitle = subtitle
        super()
      end

      def call
        tag.span @subtitle, class: 'h4 d-block my-1'
      end

      def render?
        @subtitle.present?
      end
    end
  end
end
