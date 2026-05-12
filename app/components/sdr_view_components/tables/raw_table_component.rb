# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering a table in which rows must be provided.
    class RawTableComponent < BaseTableComponent
      renders_many :rows
    end
  end
end
