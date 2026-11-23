# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Tables::ListCellComponent, type: :component do
  context 'with item values' do
    it 'renders the cell' do
      render_inline(described_class.new(item_values: ['First value', 'Second value']))

      expect(page).to have_css('ul li', text: 'First value')
      expect(page).to have_css('ul li', text: 'Second value')
    end
  end

  context 'with items' do
    it 'renders the cell' do
      render_inline(described_class.new.tap do |component|
        component.with_item { 'First item' }
        component.with_item { 'Second item' }
      end)

      expect(page).to have_css('ul li', text: 'First item')
      expect(page).to have_css('ul li', text: 'Second item')
    end
  end

  context 'with one item value' do
    it 'renders the value without a list' do
      render_inline(described_class.new(item_values: ['<a href="/collection">Collection</a>'.html_safe]))

      expect(page).to have_link('Collection', href: '/collection')
      expect(page).to have_no_css('ul')
    end

    it 'escapes an unsafe value' do
      render_inline(described_class.new(item_values: ['Project : <b>Maps</b>']))

      expect(page).to have_text('Project : <b>Maps</b>')
    end
  end

  context 'with one item' do
    it 'renders the item without a list' do
      render_inline(described_class.new.tap do |component|
        component.with_item { 'Only item' }
      end)

      expect(page).to have_text('Only item')
      expect(page).to have_no_css('ul')
    end
  end

  context 'with no item values' do
    it 'renders nothing' do
      render_inline(described_class.new(item_values: []))

      expect(page).to have_no_css('body *')
    end
  end
end
