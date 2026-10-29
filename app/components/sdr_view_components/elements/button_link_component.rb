# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a button that is a link
    class ButtonLinkComponent < BaseComponent
      def initialize(link:, label: nil, variant: :primary, classes: [], bordered: true, size: nil, # rubocop:disable Metrics/ParameterLists
                     disabled: false, **options)
        @link = link
        @label = label
        @variant = variant
        @options = options
        @classes = classes
        @bordered = bordered
        @size = size
        @disabled = disabled
        super()
      end

      attr_reader :link, :label

      def call
        classes = ComponentSupport::ButtonSupport.classes(classes: @classes, variant: @variant,
                                                          bordered: @bordered, size: @size, disabled: @disabled)
        # The class only styles the link; dropping href keeps it from being followed from the keyboard.
        return tag.a(class: classes, aria: { disabled: true }, tabindex: -1, **@options) { label || content } if @disabled

        link_to(link, class: classes, **@options) do
          label || content
        end
      end
    end
  end
end
