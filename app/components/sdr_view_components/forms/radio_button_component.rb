# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form radio button field
    class RadioButtonComponent < FieldComponent
      def initialize(**args)
        args[:container_class] = merge_classes('form-check', args[:container_class])
        args[:input_class] = merge_classes('form-check-input', args[:input_class])
        args[:label_default_class] = merge_classes('form-check-label', args[:input_class])
        super
      end

      def component
        SdrViewComponents::Forms::BasicRadioButtonComponent.new(form:, field_name:, **input_args)
      end
    end
  end
end
