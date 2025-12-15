# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form file field
    class BasicFileComponent < BaseComponent
      def initialize(form:, field_name:, **args)
        @form = form
        @field_name = field_name
        @args = args
        super()
      end

      attr_reader :args, :form, :field_name

      def call
        form.file_field field_name, **args
      end
    end
  end
end
