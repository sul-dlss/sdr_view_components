# frozen_string_literal: true

module SulViewComponents
  module Elements
    class ToastComponentPreview < ViewComponent::Preview
      def default
        render SdrViewComponents::Elements::ToastComponent.new(title: 'Alert!', text: 'Black Toast text')
      end

      def default_with_close_text
        render SdrViewComponents::Elements::ToastComponent.new(title: 'Alert!', text: 'Black Toast text', close_text: 'Undo')
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
    end
  end
end
