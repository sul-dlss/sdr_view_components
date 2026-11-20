# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::ButtonComponent, type: :component do
  it 'renders the button label' do
    render_inline(described_class.new(label: 'Button label'))
    expect(page).to have_css('.btn', text: 'Button label')
  end

  context 'with a variant' do
    it 'renders the button' do
      render_inline(described_class.new(label: 'Button label', variant: 'danger'))
      expect(page).to have_css('.btn.btn-danger')
    end
  end

  context 'with classes' do
    it 'renders the button' do
      render_inline(described_class.new(label: 'Button label', classes: %w[class1 class2]))
      expect(page).to have_css('.btn.class1.class2')
    end
  end

  context 'when disabled' do
    it 'renders a disabled button with the disabled class' do
      render_inline(described_class.new(label: 'Button label', disabled: true))
      expect(page).to have_button('Button label', class: 'btn disabled', disabled: true)
    end
  end

  context 'when not disabled' do
    it 'renders an enabled button without the disabled class' do
      render_inline(described_class.new(label: 'Button label', disabled: false))
      expect(page).to have_button('Button label', disabled: false)
      expect(page).to have_no_button(class: 'disabled', disabled: :all)
    end
  end
end
