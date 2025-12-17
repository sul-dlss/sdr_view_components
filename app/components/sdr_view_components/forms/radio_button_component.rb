# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form radio button field
    class RadioButtonComponent < FieldComponent
      def initialize(**args)
        args[:container_classes] = merge_classes('form-check', args[:container_classes])
        args[:label_default_class] = 'form-check-label'
        super
      end

      def input_component
        SdrViewComponents::Forms::BasicRadioButtonComponent.new(form:, field_name:, **input_args)
      end

      def label_field_name
        "#{sanitize(field_name)}_#{sanitize(input_args[:value])}"
      end

      private

      # From https://github.com/rails/rails/blob/main/actionview/lib/action_view/helpers/form_tag_helper.rb
      def sanitize(value)
        value.to_s.delete(']').tr('^-a-zA-Z0-9:.', '_')
      end
    end
  end
end
