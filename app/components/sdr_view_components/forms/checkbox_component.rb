# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form checkbox field
    class CheckboxComponent < FieldComponent
      def initialize(**args)
        args[:container_class] = merge_classes('form-check', args[:container_class])
        args[:input_class] = merge_classes('form-check-input', args[:input_class])
        args[:label_default_class] = merge_classes('form-check-label', args[:input_class])
        super
      end

      attr_reader :value

      # The component must implement a `default_component` method in order
      # to render in the component slot of the FieldComponent.
      def default_component
        render SdrViewComponents::Forms::BasicCheckboxComponent.new(form:, field_name:, data:, **input_args)
      end
    end
  end
end
