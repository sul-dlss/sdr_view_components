# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for a group of radio buttons that share a field.
    # The field's error is rendered once for the group rather than under each radio button.
    class RadioButtonGroupComponent < BaseComponent
      # A block given to with_radio_button is rendered as the radio button's additional container content.
      renders_many :radio_buttons, lambda { |**args, &block|
        Forms::RadioButtonComponent.new(form:, field_name:, show_errors: false, **args).tap do |radio_button|
          radio_button.with_additional_container_content(&block) if block
        end
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
