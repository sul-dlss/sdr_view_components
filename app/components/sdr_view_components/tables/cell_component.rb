# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering a table cell.
    class CellComponent < BaseComponent
      def initialize(colspan: nil, classes: [], **cell_options)
        @colspan = colspan
        @classes = classes
        @cell_options = cell_options
        super()
      end

      attr_reader :colspan, :cell_options

      def classes
        merge_classes(@classes)
      end
    end
  end
end
