# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Structure::HeaderComponent, type: :component do
  it 'raises ArgumentError when title is missing' do
    expect { render_inline(described_class.new) }.to raise_error(ArgumentError, 'missing keyword: :title')
  end

  it 'renders title and subtitle' do
    render_inline(described_class.new(title: 'Test Header', subtitle: 'Test Subtitle'))

    expect(page).to have_text('Test Header')
    expect(page).to have_text('Test Subtitle')
    expect(page).to have_link('Stanford University Libraries', class: 'navbar-logo')
    expect(page).to have_css('span.rosette-logo')
  end

  context 'when sul_logo is polychrome' do
    it 'renders sul logo with polychrome class' do
      render_inline(described_class.new(title: 'Test Header', sul_logo: 'polychrome'))

      expect(page).to have_link('Stanford University Libraries', class: 'navbar-logo polychrome')
    end
  end

  context 'when subtitle is not provided' do
    it 'does not render subtitle element' do
      render_inline(described_class.new(title: 'Test Header'))

      expect(page).to have_text('Test Header')
      expect(page).to have_no_selector('span.h4')
    end
  end

  context 'when rosette is false' do
    it 'does not render rosette element' do
      render_inline(described_class.new(title: 'Test Header', rosette: false))

      expect(page).to have_text('Test Header')
      expect(page).to have_no_css('span.rosette-logo')
    end
  end
end
