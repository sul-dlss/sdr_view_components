# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form text area field
    class TextAreaComponent < FieldComponent
      def input_component
        SdrViewComponents::Forms::BasicTextAreaComponent.new(form:, field_name:, **input_args)
      end
    end
  end
end
