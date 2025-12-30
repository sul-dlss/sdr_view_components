# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form checkbox field
    class CheckboxComponent < FieldComponent
      def initialize(**args)
        args[:container_classes] = merge_classes('form-check', args[:container_classes])
        args[:label_default_class] = 'form-check-label'
        args[:variant] = :help_text_below
        super
      end

      def input_component
        SdrViewComponents::Forms::BasicCheckboxComponent.new(form:, field_name:, **input_args)
      end
    end
  end
end
