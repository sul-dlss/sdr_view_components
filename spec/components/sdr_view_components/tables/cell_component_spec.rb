# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Tables::CellComponent, type: :component do
  it 'renders a table cell with content' do
    result = render_inline(described_class.new) { 'Cell content' }
    wrapped_page = Capybara.string("<table><tbody><tr>#{result.to_html}</tr></tbody></table>")

    expect(wrapped_page).to have_css('td', text: 'Cell content')
  end

  it 'renders colspan' do
    result = render_inline(described_class.new(colspan: 2)) { 'Cell content' }
    wrapped_page = Capybara.string("<table><tbody><tr>#{result.to_html}</tr></tbody></table>")

    expect(wrapped_page).to have_css('td[colspan="2"]', text: 'Cell content')
  end

  it 'renders classes' do
    result = render_inline(described_class.new(classes: %w[first-class second-class first-class])) { 'Cell content' }

    wrapped_page = Capybara.string("<table><tbody><tr>#{result.to_html}</tr></tbody></table>")

    expect(wrapped_page).to have_css('td.first-class.second-class', text: 'Cell content')
  end

  it 'renders html options' do
    result = render_inline(
      described_class.new(
        id: 'custom-cell',
        data: { controller: 'my-controller' }
      )
    ) { 'Cell content' }
    wrapped_page = Capybara.string("<table><tbody><tr>#{result.to_html}</tr></tbody></table>")

    expect(wrapped_page).to have_css('td#custom-cell[data-controller="my-controller"]', text: 'Cell content')
  end
end
