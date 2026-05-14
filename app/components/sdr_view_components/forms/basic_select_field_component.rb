# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form select field
    class BasicSelectFieldComponent < BasicComponent
      def initialize(form:, field_name:, options:, prompt: false, classes: [], **args) # rubocop:disable Metrics/ParameterLists
        @options = options
        @prompt = prompt
        super(form:, field_name:, classes:, **args)
      end

      attr_reader :options, :prompt

      def call
        form.select field_name, options, { prompt: }, { class: classes, **args }
      end

      def classes
        merge_classes('form-select', @classes)
      end
    end
  end
end
