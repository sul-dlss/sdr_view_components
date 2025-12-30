# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form file field
    class BasicFileComponent < BasicComponent
      def call
        form.file_field field_name, class: classes, **args
      end

      def classes
        merge_classes('form-control', @classes)
      end
    end
  end
end
