# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for a toggle option
    class ToggleOptionComponent < BaseComponent
      def initialize(form:, field_name:, label:, value:, data: {}, classes: [], aria: {}, position: :left, **args) # rubocop:disable Metrics/ParameterLists, Metrics/MethodLength
        raise ArgumentError, 'position must be :left or :right' unless %i[left right].include?(position)

        @form = form
        @field_name = field_name
        @label = label
        @value = value
        @data = data
        @classes = classes
        @aria = aria
        @args = args
        @position = position
        super()
      end

      attr_reader :form, :field_name, :label, :value, :data, :aria, :args

      def input_classes
        merge_classes('btn-check', @classes, aria[:invalid] ? 'is-invalid' : nil)
      end

      def button_classes
        merge_classes('btn', @position == :left ? 'rounded-start-pill' : 'rounded-end-pill')
      end
    end
  end
end
