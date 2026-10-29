# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::ButtonLinkComponent, type: :component do
  let(:link) { '/path' }

  it 'renders the button link' do
    render_inline(described_class.new(link:, label: 'Button link'))
    expect(page).to have_css("a.btn.btn-primary[href='#{link}']", text: 'Button link')
  end

  context 'with a label content' do
    it 'renders the button link' do
      render_inline(described_class.new(link:).with_content('Button link'))
      expect(page).to have_css('a', text: 'Button link')
    end
  end

  context 'with a variant' do
    it 'renders the button link' do
      render_inline(described_class.new(link:, variant: 'danger'))
      expect(page).to have_css('a.btn.btn-danger')
    end
  end

  context 'with classes' do
    it 'renders the button link' do
      render_inline(described_class.new(link:, classes: %w[class1 class2]))
      expect(page).to have_css('a.btn.btn-primary.class1.class2')
    end
  end

  context 'when disabled' do
    it 'renders an unfollowable button link with the disabled class' do
      render_inline(described_class.new(link:, label: 'Button link', disabled: true))
      expect(page).to have_css('a.btn.disabled[aria-disabled="true"][tabindex="-1"]', text: 'Button link')
      expect(page).to have_no_css('a[href]')
    end
  end

  context 'when not disabled' do
    it 'renders a followable button link without the disabled class' do
      render_inline(described_class.new(link:, disabled: false))
      expect(page).to have_css("a.btn[href='#{link}']")
      expect(page).to have_no_css('a.btn.disabled')
      expect(page).to have_no_css('a[aria-disabled], a[tabindex]')
    end
  end
end
