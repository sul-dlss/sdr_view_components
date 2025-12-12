# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form text field
    class TextFieldComponent < FieldComponent
      def initialize(**args)
        args[:container_class] = merge_classes('form-text', args[:container_class])
        args[:input_class] = merge_classes('form-text-input', args[:input_class])
        args[:label_default_class] = merge_classes('form-text-label', args[:input_class])
        super
      end

      def component
        SdrViewComponents::Forms::BasicTextFieldComponent.new(form:, field_name:, **input_args)
      end
    end
  end
end
