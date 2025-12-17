# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form text field
    class TextFieldComponent < FieldComponent
      def input_component
        SdrViewComponents::Forms::BasicTextFieldComponent.new(form:, field_name:, **input_args)
      end
    end
  end
end
