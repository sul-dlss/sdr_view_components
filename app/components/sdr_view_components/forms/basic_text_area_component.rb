# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form text area field
    class BasicTextAreaComponent < BaseComponent
      def initialize(form:, field_name:, **args)
        @form = form
        @field_name = field_name
        @args = args
        super()
      end

      attr_reader :args, :form, :field_name

      def call
        form.text_area field_name, **args
      end
    end
  end
end
