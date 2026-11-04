# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::CollapsibleSectionComponent, type: :component do
  it 'renders an expanded section' do
    render_inline(described_class.new(id: 'pages', heading: 'Pages (2)', level: :h3, classes: 'class1',
                                      heading_classes: 'text-uppercase')) { 'Body' }

    expect(page).to have_css('section.collapsible-section.class1')
    expect(page).to have_css('h3.text-uppercase button.collapsible-section-toggle:not(.collapsed)' \
                             '[data-bs-toggle="collapse"][data-bs-target="#pages"][aria-expanded="true"]' \
                             '[aria-controls="pages"]', text: 'Pages (2)')
    expect(page).to have_css('button i.bi-chevron-up[aria-hidden="true"]')
    expect(page).to have_css('div#pages.collapse.show', text: 'Body')
  end

  it 'renders a collapsed section' do
    render_inline(described_class.new(id: 'pages', heading: 'Pages', expanded: false)) { 'Body' }

    expect(page).to have_css('h2 button.collapsible-section-toggle.collapsed[aria-expanded="false"]')
    expect(page).to have_css('div#pages.collapse:not(.show)')
  end
end
