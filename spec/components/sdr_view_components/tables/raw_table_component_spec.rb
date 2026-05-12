# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Tables::RawTableComponent, type: :component do
  context 'with rows' do
    it 'renders the table with rows' do
      render_inline(
        described_class.new(id: 'test-table', label: 'Test Table', classes: 'table table-striped').tap do |component|
          component.with_row { '<tr><td>Row 1</td><td>Row 2</td></tr>'.html_safe }
          component.with_row { '<tr><td>Row 3</td><td>Row 4</td></tr>'.html_safe }
        end
      )

      table = page.find('table#test-table')
      expect(table).to have_css('tbody')
      expect(table).to have_css('tr', count: 2)

      row1 = table.find('tr:nth-child(1)')
      expect(row1).to have_css('td', count: 2)
      expect(row1).to have_css('td', text: 'Row 1')
      expect(row1).to have_css('td', text: 'Row 2')

      row2 = table.find('tr:nth-child(2)')
      expect(row2).to have_css('td', count: 2)
      expect(row2).to have_css('td', text: 'Row 3')
      expect(row2).to have_css('td', text: 'Row 4')
    end
  end
end
