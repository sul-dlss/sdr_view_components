# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for a toggle-like radio button group field
    class ToggleComponent < FieldComponent
      renders_one :left_toggle_option, lambda { |**args|
        Forms::ToggleOptionComponent.new(position: :left, **toggle_option_args(args))
      }
      renders_one :right_toggle_option, lambda { |**args|
        Forms::ToggleOptionComponent.new(position: :right, **toggle_option_args(args))
      }

      def initialize(form:, field_name:, **args)
        @form = form
        @field_name = field_name
        args[:label_classes] = merge_classes('d-block', args[:label_classes])
        super
      end

      attr_reader :form, :field_name

      private

      def toggle_option_args(args)
        input_args.except(:data, :classes, :aria).merge(
          form: args.fetch(:form, form),
          field_name: args.fetch(:field_name, field_name),
          data: merged_toggle_option_data(args),
          classes: merged_toggle_option_classes(args),
          aria: merged_toggle_option_aria(args)
        ).merge(toggle_option_overrides(args))
      end

      def merged_toggle_option_data(args)
        input_args.fetch(:data, {}).merge(args.fetch(:data, {}))
      end

      def merged_toggle_option_classes(args)
        merge_classes(input_args[:classes], args[:classes])
      end

      def merged_toggle_option_aria(args)
        input_args.fetch(:aria, {}).merge(args.fetch(:aria, {}))
      end

      def toggle_option_overrides(args)
        args.except(:form, :field_name, :data, :classes, :aria)
      end
    end
  end
end
