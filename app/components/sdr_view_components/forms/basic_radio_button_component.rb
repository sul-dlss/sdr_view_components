# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form radio button field
    class BasicRadioButtonComponent < BasicComponent
      def initialize(form:, field_name:, value:, classes: [], **args)
        @value = value
        super(form:, field_name:, classes:, **args)
      end

      attr_reader :value

      def call
        form.radio_button field_name, value, class: classes, **args
      end

      def classes
        merge_classes('form-check-input', @classes)
      end
    end
  end
end
