# frozen_string_literal: true

module SdrViewComponents
  module Elements
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

        def component
          form.check_box field_name, input_args
        end
      end
    end
  end
end
