# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form checkbox field
    class BasicCheckboxComponent < BasicComponent
      def call
        form.check_box field_name, class: classes, **args
      end

      def classes
        merge_classes('form-check-input', @classes)
      end
    end
  end
end
