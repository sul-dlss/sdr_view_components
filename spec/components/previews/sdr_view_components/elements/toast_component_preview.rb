# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class ToastComponentPreview < ViewComponent::Preview
      # @!group Variants
      def default
        render SdrViewComponents::Elements::ToastComponent.new(title: 'Alert!', text: 'Black Toast text')
      end

      def red
        render SdrViewComponents::Elements::ToastComponent.new(title: 'Alert!', text: 'Red Toast text', variant: :red)
      end

      def green
        render SdrViewComponents::Elements::ToastComponent.new(title: 'Alert!', text: 'Green Toast text', variant: :green)
      end

      def poppy
        render SdrViewComponents::Elements::ToastComponent.new(title: 'Alert!', text: 'Poppy Toast text', variant: :poppy)
      end
      # @!endgroup

      def disappearing; end

      def with_close_text
        render SdrViewComponents::Elements::ToastComponent.new(title: 'Alert!', text: 'Black Toast text', close_text: 'Undo')
      end
    end
  end
end
