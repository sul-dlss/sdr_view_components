# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering a table row.
    class RowComponent < BaseComponent
      renders_many :cells, SdrViewComponents::Tables::CellComponent
      renders_one :label_content

      def initialize(label: nil, first_value: nil, values: [], value: nil, tooltip: nil, **row_options) # rubocop:disable Metrics/ParameterLists
        # Provide either label or first_value but not both; these are rendered in the first column
        # label renders with <th> (bold), first_value is a normal <td>
        @label = label
        @first_value = first_value
        # Provide either value, values or cells (e.g. for content files).
        @values = Array(value).presence || values
        @tooltip = tooltip
        @row_options = row_options

        raise ArgumentError if label.present? && first_value.present?

        super()
      end

      attr_reader :label, :values, :tooltip, :first_value, :row_options

      def empty_cell?
        label.present? && values.empty? && !cells?
      end
    end
  end
end
