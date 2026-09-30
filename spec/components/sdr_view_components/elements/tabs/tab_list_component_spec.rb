# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::Tabs::TabListComponent, type: :component do
  it 'renders tab list' do
    render_inline(described_class.new) do |component|
      component.with_tab(label: 'Tab 1', id: 'tab-1', pane_id: 'pane-1', active: true)
      component.with_tab(label: 'Tab 2', id: 'tab-2', pane_id: 'pane-2')
      component.with_header { '<h1>Header</h1>'.html_safe }
      component.with_pane(id: 'pane-1', tab_id: 'tab-1', active: true) { '<p>Content 1</p>'.html_safe }
      component.with_pane(id: 'pane-2', tab_id: 'tab-2') { '<p>Content 2</p>'.html_safe }
    end

    expect(page).to have_css(
      'ul.nav li.nav-item button.nav-link.active[id="tab-1"][data-bs-target="#pane-1"][aria-selected="true"]',
      text: 'Tab 1'
    )
    expect(page).to have_css(
      'button.nav-link[id="tab-2"][aria-selected="false"]:not(.active)',
      text: 'Tab 2'
    )
    expect(page).to have_css('h1', text: 'Header')

    expect(page).to have_css(
      'div.tab-content div.tab-pane.fade.show.active[id="pane-1"][aria-labelledby="tab-1"] p',
      text: 'Content 1'
    )

    expect(page).to have_css(
      'div.tab-pane.fade[id="pane-2"]:not(.show.active) p',
      text: 'Content 2'
    )
  end

  context 'when collapse_below is not given' do
    it 'does not render a select or collapse controller' do
      render_inline(described_class.new) do |component|
        component.with_tab(label: 'Tab 1', id: 'tab-1', pane_id: 'pane-1', active: true)
      end

      expect(page).to have_no_select
      expect(page).to have_no_css('[data-controller="sdr-tab-select"]')
      expect(page).to have_css('ul.nav:not(.d-none)')
    end
  end

  context 'when collapse_below is given' do
    it 'renders a select alongside the tabs, hidden/shown at the given breakpoint' do
      render_inline(described_class.new(collapse_below: :xl)) do |component|
        component.with_tab(label: 'Tab 1', id: 'tab-1', pane_id: 'pane-1', active: true)
        component.with_tab(label: 'Tab 2', id: 'tab-2', pane_id: 'pane-2')
      end

      expect(page).to have_css('[data-controller="sdr-tab-select"][data-action="shown.bs.tab->sdr-tab-select#sync"]')
      expect(page).to have_css('ul.nav.d-none.d-xl-flex[role="tablist"] button.nav-link', count: 2)
      expect(page).to have_css(
        'select.form-select.d-xl-none[aria-label="Select a tab"][data-sdr-tab-select-target="select"]' \
        '[data-action="sdr-tab-select#change turbo:before-morph-element->sdr-tab-select#preventMorph"]'
      )
      expect(page).to have_css('select option[value="tab-1"][selected]', text: 'Tab 1')
      expect(page).to have_css('select option[value="tab-2"]:not([selected])', text: 'Tab 2')
    end
  end

  context 'when overflow_menu is not given' do
    it 'does not render an overflow menu or controller' do
      render_inline(described_class.new) do |component|
        component.with_tab(label: 'Tab 1', id: 'tab-1', pane_id: 'pane-1', active: true)
      end

      expect(page).to have_no_css('[data-controller="sdr-tab-overflow"]')
      expect(page).to have_no_css('.dropdown')
    end
  end

  context 'when overflow_menu is true' do
    it 'renders a hidden "More" dropdown after the tabs' do
      render_inline(described_class.new(overflow_menu: true, collapse_below: :xl)) do |component|
        component.with_tab(label: 'Tab 1', id: 'tab-1', pane_id: 'pane-1', active: true)
        component.with_tab(label: 'Tab 2', id: 'tab-2', pane_id: 'pane-2')
      end

      expect(page).to have_css(
        'ul.nav[data-controller="sdr-tab-overflow"]' \
        '[data-action="shown.bs.tab->sdr-tab-overflow#syncMoreActive ' \
        'turbo:before-morph-element->sdr-tab-overflow#preventMorph"] > li.nav-item',
        count: 3
      )
      expect(page).to have_css(
        'ul.nav > li.nav-item.dropdown.d-none:last-child[data-sdr-tab-overflow-target="more"] ' \
        'button.nav-link.dropdown-toggle[data-bs-toggle="dropdown"]',
        text: 'More'
      )
      expect(page).to have_css('li.dropdown ul.dropdown-menu[data-sdr-tab-overflow-target="menu"]:empty')
      expect(page).to have_css('select option', count: 2)
    end
  end

  context 'when content_classes is given' do
    it 'merges the additional classes onto the tab content container' do
      render_inline(described_class.new(content_classes: %w[extra-class another-class])) do |component|
        component.with_tab(label: 'Tab 1', id: 'tab-1', pane_id: 'pane-1', active: true)
        component.with_pane(id: 'pane-1', tab_id: 'tab-1', active: true) { '<p>Content 1</p>'.html_safe }
      end

      expect(page).to have_css('div.tab-content.extra-class.another-class')
    end
  end

  context 'when collapse_below is invalid' do
    it 'raises an error' do
      expect { described_class.new(collapse_below: :xs) }.to raise_error(ArgumentError, 'Invalid collapse_below: xs')
    end
  end
end
