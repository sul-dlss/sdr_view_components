# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Base component for the folder and file rows of a treegrid table.
    class TreegridRowComponent < BaseComponent
      def initialize(path_parts:, hidden: false)
        @path_parts = path_parts
        @hidden = hidden
        super()
      end

      attr_reader :path_parts

      def hidden?
        @hidden
      end

      # Subclasses must provide level (the row's depth in the tree, starting at 1).
      def indent_style
        "padding-left: #{((level - 1) * 1.25) + 0.5}rem;"
      end
    end
  end
end
