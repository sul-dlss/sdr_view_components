# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering the Expand all / Collapse all row of a treegrid table.
    class TreegridExpandCollapseRowComponent < BaseComponent
      def initialize(colspan:)
        @colspan = colspan
        super()
      end

      attr_reader :colspan
    end
  end
end
