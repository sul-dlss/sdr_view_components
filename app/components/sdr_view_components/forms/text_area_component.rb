# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form text area field
    class TextAreaComponent < FieldComponent
      def initialize(**args)
        args[:container_class] = merge_classes('form-text', args[:container_class])
        args[:input_class] = merge_classes('form-control', args[:input_class])
        super
      end

      def input_component
        SdrViewComponents::Forms::BasicTextAreaComponent.new(form:, field_name:, **input_args)
      end
    end
  end
end
