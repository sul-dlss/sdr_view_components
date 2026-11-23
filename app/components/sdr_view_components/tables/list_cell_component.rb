# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering a list in a table cell; a single value is rendered without a list.
    class ListCellComponent < BaseComponent
      renders_many :items

      def initialize(item_values: [])
        # Provide items or item_values
        @item_values = item_values
        super()
      end

      attr_reader :item_values

      def list_items
        items? ? items : item_values
      end

      def render?
        list_items.any?
      end
    end
  end
end
