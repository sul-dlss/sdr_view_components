# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for a toggle-like radio button group field
    class ToggleComponent < FieldComponent
      renders_one :left_toggle_option, lambda { |**args|
        Forms::ToggleOptionComponent.new(position: :left, **args)
      }
      renders_one :right_toggle_option, lambda { |**args|
        Forms::ToggleOptionComponent.new(position: :right, **args)
      }

      def initialize(form:, field_name:, **args)
        @form = form
        @field_name = field_name
        args[:label_classes] = merge_classes('d-block', args[:label_classes])
        super
      end

      attr_reader :form, :field_name

      # toggle-radio applies the component library's toggle styles.
      def container_classes
        merge_classes('toggle-radio', super)
      end
    end
  end
end
