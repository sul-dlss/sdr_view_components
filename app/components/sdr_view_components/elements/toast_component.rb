# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for rendering a toast element.
    class ToastComponent < BaseComponent
      def initialize(title:, text: nil, close_text: nil, variant: :black, disappearing: false)
        @title = title
        @text = text
        @close_text = close_text
        @variant = variant
        @disappearing = disappearing
        super()
      end

      attr_reader :title, :text, :close_text, :variant, :disappearing

      def classes
        merge_classes('toast align-items-center show', ('toast-disappear' if disappearing))
      end

      def toast_body_classes
        merge_classes([background_color], %w[toast-body text-white])
      end

      def background_color
        case variant
        when :red
          'bg-stanford-digital-red'
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
