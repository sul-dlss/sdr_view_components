# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Base component for basic components.
    class BasicComponent < BaseComponent
      # Subclasses may override this if additional args, e.g., value, are needed.
      def initialize(form:, field_name:, classes: [], **args)
        @form = form
        @field_name = field_name
        @args = args
        @classes = classes
        super()
      end

      attr_reader :args, :form, :field_name

      def call
        raise NotImplementedError, 'Subclasses must implement the call method'
      end

      # Subclasses can override this to provide default classes, e.g., form-check-input
      def classes
        merge_classes(@classes)
      end
    end
  end
end
