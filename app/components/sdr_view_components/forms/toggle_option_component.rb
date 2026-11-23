# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for a toggle option
    class ToggleOptionComponent < BaseComponent
      # @param checked [Boolean, nil] overrides the checked state, which otherwise comes from the form's object
      def initialize(form:, field_name:, label:, value:, data: {}, position: :left, checked: nil) # rubocop:disable Metrics/ParameterLists
        raise ArgumentError, 'position must be :left or :right' unless %i[left right].include?(position)

        @form = form
        @field_name = field_name
        @label = label
        @value = value
        @data = data
        @position = position
        @checked = checked
        super()
      end

      attr_reader :form, :field_name, :label, :value, :data

      # Rails treats a checked key, even nil, as an override, so it is only passed when given.
      def radio_options
        { type: 'radio', class: 'btn-check', data:, checked: @checked }.compact
      end

      # The component library's toggle-radio styles round each option, so no rounding classes are added here.
      def label_classes
        'btn'
      end
    end
  end
end
