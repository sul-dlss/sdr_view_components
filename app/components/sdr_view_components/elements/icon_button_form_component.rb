# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a button which is an icon and is wrapped in a form
    class IconButtonFormComponent < BaseComponent
      include ComponentSupport::IconButtonSupport

      def initialize(link:, icon:, label:, variant: :'outline-primary', size: nil, classes: [], icon_classes: [], # rubocop:disable Metrics/ParameterLists, Metrics/MethodLength
                     method: :get, confirm: nil, top: true, data: {}, disabled: false, params: {})
        @link = link
        @icon = icon
        @label = label
        @variant = variant
        @size = size
        @classes = classes
        @icon_classes = icon_classes
        @method = method
        @confirm = confirm
        @top = top
        @data = data
        @disabled = disabled
        @params = params
        super()
      end

      attr_reader :link, :params, :label

      def call
        button_to(link, method: @method,
                        class: ComponentSupport::ButtonSupport.classes(variant: @variant, size: @size, classes:,
                                                                       disabled: @disabled),
                        # The class only styles the button; the attribute keeps it from submitting the form.
                        disabled: @disabled,
                        form: { data: },
                        params:) do
          concat button_icon
          concat tag.span(label, class: 'visually-hidden')
        end
      end

      def classes
        merge_classes(%w[icon-button border border-0], @classes)
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
