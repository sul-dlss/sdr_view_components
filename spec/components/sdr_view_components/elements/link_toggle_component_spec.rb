# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::LinkToggleComponent, type: :component do
  let(:component) { described_class.new(links:, label: 'Select view', classes: 'mb-3') }
  let(:links) do
    [
      { label: 'List view', path: '/list', selected: true },
      { label: 'Grid view', path: '/grid', selected: false, data: { test: 'test_data' } }
    ]
  end

  it 'renders a group of links with the selected link marked' do
    render_inline(component)

    expect(page).to have_css('div.toggle-radio.mb-3 div.btn-group[role="group"][aria-label="Select view"]')
    expect(page).to have_link('List view', href: '/list', class: %w[btn rounded-pill active])
    expect(page).to have_css('a.active[aria-current="page"]', count: 1, text: 'List view')
    expect(page).to have_link('Grid view', href: '/grid', class: %w[btn rounded-pill])
    expect(page).to have_no_css('a.active', text: 'Grid view')
    expect(page).to have_no_css('a[aria-current]', text: 'Grid view')
    expect(page).to have_css('a[data-test="test_data"]', text: 'Grid view')
  end
end
