# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering a table header.
    class HeaderComponent < BaseComponent
      def initialize(label:, classes: [], tooltip: nil, **header_options)
        @label = label
        @classes = classes
        @tooltip = tooltip
        @header_options = header_options
        super()
      end

      attr_reader :label, :tooltip, :header_options

      def classes
        merge_classes(@classes)
      end
    end
  end
end
