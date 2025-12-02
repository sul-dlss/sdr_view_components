# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form checkbox field
    class BasicCheckboxComponent < BaseComponent
      def initialize(form:, field_name:, data: nil, **args)
        @form = form
        @field_name = field_name
        @args = args
        @data = data
        super()
      end

      attr_reader :args, :data, :form, :field_name, :value

      def call
        form.check_box field_name, data:, **args
      end
    end
  end
end
