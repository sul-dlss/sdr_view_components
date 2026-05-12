# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering a table.
    class TableComponent < BaseTableComponent
      renders_many :rows, SdrViewComponents::Tables::RowComponent
    end
  end
end
