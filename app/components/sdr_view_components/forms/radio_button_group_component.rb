# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for a group of radio buttons that share a field.
    # The field's error is rendered once for the group rather than under each radio button.
    class RadioButtonGroupComponent < BaseComponent
      renders_many :radio_buttons, lambda { |**args|
        Forms::RadioButtonComponent.new(form:, field_name:, show_errors: false, **args)
      }

      # @param fieldset_args [Hash] Passed to FieldsetComponent (e.g. label:, tooltip:, mark_required:, help_text:).
      def initialize(form:, field_name:, **fieldset_args)
        @form = form
        @field_name = field_name
        @fieldset_args = fieldset_args
        super()
      end

      attr_reader :form, :field_name, :fieldset_args
    end
  end
end
