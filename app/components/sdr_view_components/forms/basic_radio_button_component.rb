# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form radio button field
    class BasicRadioButtonComponent < BaseComponent
      def initialize(form:, field_name:, value:, **args)
        @form = form
        @field_name = field_name
        @value = value
        @args = args
        super()
      end

      attr_reader :args, :form, :field_name, :value

      def call
        form.radio_button field_name, value, **args
      end
    end
  end
end
