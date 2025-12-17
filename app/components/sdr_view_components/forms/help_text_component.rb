# frozen_string_literal: true

# Component for rendering help text for form fields.
module SdrViewComponents
  module Forms
    # Component for rendering help text for form fields.
    class HelpTextComponent < BaseComponent
      # this component can take plain text via 'help_text' or a block (which can contain html)
      # it will render the help_text if provided, else it will render the block content
      def initialize(id:, text: nil, classes: [], **args)
        @text = text
        @id = id
        @classes = classes
        @args = args
        super()
      end

      attr_reader :text, :id, :args

      def render?
        text.present? || content.present?
      end

      def classes
        merge_classes('form-text', @classes)
      end
    end
  end
end
