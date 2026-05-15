# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form select fields
    class SelectFieldComponent < FieldComponent
      def initialize(options:, prompt: false, **)
        @options = options
        @prompt = prompt
        super(**)
      end

      attr_reader :options, :prompt

      def input_component
        SdrViewComponents::Forms::BasicSelectFieldComponent.new(form:, field_name:, options:, prompt:, **input_args)
      end
    end
  end
end
