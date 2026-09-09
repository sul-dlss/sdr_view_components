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
        "#{sanitize_method_name(field_name)}_#{sanitize_value(input_args[:value])}"
      end

      private

      # The input is rendered by form.radio_button, so the label's for must match the id that
      # ActionView::Helpers::Tags::Base generates. These mirror its sanitized_method_name and
      # sanitized_value. Note this is *not* form_tag_helper.rb's sanitize_to_id, which applies
      # to radio_button_tag and disagrees on uppercase letters, '.', and other non-word chars.
      # From https://github.com/rails/rails/blob/main/actionview/lib/action_view/helpers/tags/base.rb
      def sanitize_method_name(name)
        name.to_s.delete_suffix('?')
      end

      def sanitize_value(value)
        value.to_s.gsub(/[\s.]/, '_').gsub(/[^-[[:word:]]]/, '').downcase
      end
    end
  end
end
