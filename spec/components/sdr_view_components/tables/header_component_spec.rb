# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Tables::HeaderComponent, type: :component do
  it 'renders the row' do
    result = render_inline(described_class.new(classes: 'col-6', label: 'First header', tooltip: 'First tooltip'))
    wrapped_page = Capybara.string("<table><thead><tr>#{result.to_html}</tr></thead></table>")

    expect(wrapped_page).to have_css('table thead tr th.col-6', text: 'First header')
    expect(wrapped_page).to have_css('.tooltip-info[data-bs-title="First tooltip"]')
  end
end
