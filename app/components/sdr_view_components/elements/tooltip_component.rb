# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for rendering a tooltip.
    class TooltipComponent < BaseComponent
      def initialize(target_label:, tooltip: nil, data: {})
        @target_label = target_label
        @tooltip = tooltip
        @data = data
        super()
      end

      private

      attr_reader :tooltip, :target_label

      def render?
        tooltip.present?
      end

      def data
        {
          bs_html: true,
          bs_toggle: 'tooltip',
          bs_title: tooltip,
          bs_trigger: 'focus',
          tooltips_target: 'icon'
        }.merge(@data)
      end
    end
  end
end
