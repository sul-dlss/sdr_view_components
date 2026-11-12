# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering a folder row of a treegrid table.
    class TreegridFolderRowComponent < TreegridRowComponent
      # @param path_parts [Array<String>] the folder's path (e.g., ['folder1', 'subfolder'])
      # @param empty_cells [Integer] the number of empty cells following the folder name
      def initialize(path_parts:, expanded:, empty_cells:, hidden: false)
        @expanded = expanded
        @empty_cells = empty_cells
        super(path_parts:, hidden:)
      end

      attr_reader :empty_cells

      def expanded?
        @expanded
      end

      def level
        path_parts.size
      end

      def label
        path_parts.last
      end

      # Identifies the folder when the table is rendered again.
      def key
        path_parts.join('/')
      end
    end
  end
end
