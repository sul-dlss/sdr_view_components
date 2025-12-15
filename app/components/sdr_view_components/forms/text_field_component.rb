# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form text field
    class TextFieldComponent < FieldComponent
      def initialize(**args)
        args[:container_class] = merge_classes('field-container', args[:container_class])
        args[:input_class] = merge_classes('form-control', args[:input_class])
        super
      end

      def input_component
        SdrViewComponents::Forms::BasicTextFieldComponent.new(form:, field_name:, **input_args)
      end
    end
  end
end
