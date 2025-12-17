# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form file field
    class FileComponent < FieldComponent
      def input_component
        SdrViewComponents::Forms::BasicFileComponent.new(form:, field_name:, **input_args)
      end
    end
  end
end
