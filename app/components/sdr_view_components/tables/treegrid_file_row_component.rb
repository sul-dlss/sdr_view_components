# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering a file row of a treegrid table.
    # Within the row, the element with data-sdr-treegrid-target="fileAction" (if any) is activated by Enter.
    class TreegridFileRowComponent < TreegridRowComponent
      renders_one :label_content
      renders_many :cells, SdrViewComponents::Tables::CellComponent

      # @param path_parts [Array<String>] the path of the file's folder (e.g., ['folder1', 'subfolder'])
      # @param label [String] the file name; alternatively, provide label_content
      def initialize(path_parts: [], label: nil, hidden: false, **row_options)
        @label = label
        @row_options = row_options
        super(path_parts:, hidden:)
      end

      attr_reader :label, :row_options

      def level
        path_parts.size + 1
      end
    end
  end
end
