# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for rendering a toast element.
    # The disappearing toast uses `sdr_view_components/toast_controller` to remove itself from the DOM after its
    # fade-out animation completes.
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

      def data
        { controller: 'sdr-toast' } if disappearing
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
