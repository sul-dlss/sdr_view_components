# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for rendering a toast element.
    class ToastComponent < BaseComponent
      def initialize(title:, text:, close_text: nil, variant: :black)
        @title = title
        @text = text
        @close_text = close_text
        @variant = variant
        super()
      end

      attr_reader :title, :text, :close_text, :variant

      def toast_class
        merge_classes([background_color], %w[toast-body text-white])
      end

      def background_color
        case variant
        when :red
          'bg-stanford-cardinal'
        when :green
          'bg-stanford-digital-green'
        when :poppy
          'bg-poppy-dark'
        else
          'bg-stanford-black'
        end
      end
    end
  end
end
