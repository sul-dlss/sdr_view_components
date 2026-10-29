# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a button that is wrapped in a form
    class ButtonFormComponent < BaseComponent
      def initialize(link:, label: nil, variant: :primary, size: nil, classes: [], method: :get, confirm: nil, # rubocop:disable Metrics/ParameterLists, Metrics/MethodLength
                     top: true, data: {}, disabled: false, params: {})
        @link = link
        @label = label
        @variant = variant
        @size = size
        @classes = classes
        @method = method
        @confirm = confirm
        @top = top
        @data = data
        @disabled = disabled
        @params = params
        super()
      end

      attr_reader :link, :params

      def call
        button_to(link, method: @method,
                        class: ComponentSupport::ButtonSupport.classes(variant: @variant, size: @size, classes:,
                                                                       disabled: @disabled),
                        # The class only styles the button; the attribute keeps it from submitting the form.
                        disabled: @disabled,
                        form: { data: },
                        params:) do
          @label || content
        end
      end

      def classes
        merge_classes(@classes)
      end

      def data
        @data.tap do |data|
          data[:turbo_frame] = '_top' if @top
          data[:turbo_confirm] = @confirm if @confirm
        end
      end
    end
  end
end
