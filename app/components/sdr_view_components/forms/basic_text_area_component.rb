# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form text area field
    class BasicTextAreaComponent < BasicComponent
      def call
        form.text_area field_name, class: classes, **args
      end

      def classes
        merge_classes('form-control', @classes)
      end
    end
  end
end
