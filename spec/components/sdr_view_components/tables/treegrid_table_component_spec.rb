# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Tables::TreegridTableComponent, type: :component do
  let(:component) { described_class.new(label: 'Files', id: 'files-table', **options) }
  let(:options) { {} }
  let(:paths) { [[], %w[dir1], %w[dir1 sub1], %w[dir1 sub1], %w[dir2 sub2]] }
  let(:row_texts) { page.all('tbody tr[aria-level]').map { |row| [row['aria-level'], row.find('th').text.strip] } }

  before do
    component.with_header(label: 'Name')
    component.with_header(label: 'Size')
    paths.each.with_index do |path_parts, index|
      component.with_file(path_parts:, label: "file#{index}.txt") { |row| row.with_cell { "#{index} MB" } }
    end
    render_inline(component)
  end

  it 'renders a treegrid with a row for each folder before its first file' do
    expect(page).to have_css('table#files-table.table-treegrid[role="treegrid"][data-controller="sdr-treegrid"]')
    expect(row_texts).to eq [
      %w[1 file0.txt],
      %w[1 dir1], %w[2 file1.txt],
      %w[2 sub1], %w[3 file2.txt], %w[3 file3.txt],
      %w[1 dir2], %w[2 sub2], %w[3 file4.txt]
    ]
    expect(page).to have_css('tr[data-sdr-treegrid-role="folder"][data-sdr-treegrid-key="dir1/sub1"]')
    # The sdr-treegrid controller puts one row in the tab order.
    expect(page).to have_css('tbody tr[aria-level][tabindex="-1"]', count: 9)
    expect(page).to have_css('tr[data-sdr-treegrid-role="folder"] th[scope="row"][role="rowheader"] + td', count: 4)
    expect(page).to have_css('tr[data-sdr-treegrid-role="file"] th[role="rowheader"] + td', text: '2 MB')
  end

  it 'renders the expand and collapse controls' do
    expect(page).to have_css('tr.treegrid-controls td[colspan="2"]')
    expect(page).to have_button('Expand all')
    expect(page).to have_button('Collapse all')
  end

  it 'renders folders expanded' do
    expect(page).to have_css('tr[aria-expanded="true"]', count: 4)
    expect(page).to have_no_css('tr[hidden]', visible: :all)
    expect(page).to have_css('table[data-sdr-treegrid-remember-expanded-value="false"]')
  end

  context 'when collapsed' do
    let(:options) { { collapsed: true, remember_expanded: true } }

    it 'renders folders collapsed, with only top-level rows visible' do
      expect(page).to have_css('tr[aria-expanded="false"]', count: 4, visible: :all)
      expect(page.all('tbody tr[aria-level]').map { |row| row.find('th').text.strip }).to eq %w[file0.txt dir1 dir2]
      expect(page).to have_css('table[data-sdr-treegrid-remember-expanded-value="true"]')
    end
  end

  context 'without folders' do
    let(:paths) { [[], []] }

    it 'renders only file rows' do
      expect(row_texts).to eq [%w[1 file0.txt], %w[1 file1.txt]]
      expect(page).to have_no_button('Expand all')
    end
  end

  context 'with remember_expanded but no id' do
    it 'raises' do
      expect { described_class.new(label: 'Files', remember_expanded: true) }.to raise_error(ArgumentError)
    end
  end
end
