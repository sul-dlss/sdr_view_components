# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form file field
    class FileComponent < FieldComponent
      def initialize(**args)
        args[:container_class] = merge_classes('form-file', args[:container_class])
        args[:input_class] = merge_classes('form-file-input', args[:input_class])
        args[:label_default_class] = merge_classes('form-file-label', args[:input_class])
        super
      end

      def input_component
        SdrViewComponents::Forms::BasicFileComponent.new(form:, field_name:, **input_args)
      end
    end
  end
end
