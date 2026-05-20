# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::ToastComponent, type: :component do
  it 'renders the toast' do
    render_inline(described_class.new(title: 'My title'))

    expect(page).to have_css(".toast[role='alert']")
    expect(page).to have_css('.fw-semibold', text: 'My title')
    expect(page).to have_button(class: 'btn-close')
  end

  context 'with text' do
    it 'renders the text' do
      render_inline(described_class.new(title: 'My title', text: 'My text'))

      expect(page).to have_text('My text')
    end
  end

  context 'with close_text' do
    it 'renders the close button text' do
      render_inline(described_class.new(title: 'My title', close_text: 'Dismiss'))

      expect(page).to have_button('Dismiss')
    end
  end

  context 'without close_text' do
    it 'does not render a text close button' do
      render_inline(described_class.new(title: 'My title'))

      expect(page).to have_no_button('Dismiss')
    end
  end

  context 'with disappearing: true' do
    it 'adds the toast-disappear class' do
      render_inline(described_class.new(title: 'My title', disappearing: true))

      expect(page).to have_css('.toast.toast-disappear')
    end
  end

  context 'with disappearing: false' do
    it 'does not add the toast-disappear class' do
      render_inline(described_class.new(title: 'My title', disappearing: false))

      expect(page).to have_no_css('.toast-disappear')
    end
  end

  context 'with a variant' do
    it 'renders with the correct background color' do
      render_inline(described_class.new(title: 'My title', variant: :red))

      expect(page).to have_css('.toast-body.bg-stanford-digital-red')
    end
  end
end
