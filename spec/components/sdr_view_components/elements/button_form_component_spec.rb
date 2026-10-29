# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::ButtonFormComponent, type: :component do
  let(:link) { '/path' }

  it 'renders the button form' do
    render_inline(described_class.new(link:, label: 'Button form'))
    form = page.find('form[data-turbo-frame="_top"][method="get"][action="/path"]')
    expect(form).to have_button('Button form', class: 'btn btn-primary', type: 'submit')
  end

  context 'with a label content' do
    it 'renders the button form' do
      render_inline(described_class.new(link:).with_content('Button form'))
      expect(page).to have_button('Button form')
    end
  end

  context 'with a variant' do
    it 'renders the button form' do
      render_inline(described_class.new(link:, variant: 'danger', label: 'Submit'))
      expect(page).to have_button('Submit', class: 'btn btn-danger')
    end
  end

  context 'with a size' do
    it 'renders the button form' do
      render_inline(described_class.new(link:, size: 'sm', label: 'Submit'))
      expect(page).to have_button('Submit', class: 'btn btn-primary btn-sm')
    end
  end

  context 'with classes' do
    it 'renders the button form' do
      render_inline(described_class.new(link:, classes: %w[class1 class2], label: 'Submit'))
      expect(page).to have_button('Submit', class: 'btn btn-primary class1 class2')
    end
  end

  context 'with a confirm message' do
    it 'renders the button form' do
      render_inline(described_class.new(link:, confirm: 'Are you sure?', label: 'Submit'))
      expect(page).to have_css('form[data-turbo-confirm="Are you sure?"]')
    end
  end

  context 'with a method' do
    it 'renders the button form' do
      render_inline(described_class.new(link:, method: :post, label: 'Submit'))
      expect(page).to have_css('form[method="post"]')
    end
  end

  context 'when top is false' do
    it 'renders the button form without-data-turbo-frame' do
      render_inline(described_class.new(link:, label: 'Button form', top: false))
      expect(page).to have_css('form')
      expect(page).to have_no_css('form[data-turbo-frame="_top"]')
    end
  end

  context 'with data' do
    it 'renders the button form' do
      render_inline(described_class.new(link:, label: 'Button form', data: { turbo_foo: 'bar' }))
      expect(page).to have_css('form[data-turbo-foo="bar"][data-turbo-frame="_top"]')
    end
  end

  context 'when disabled' do
    it 'renders a disabled button with the disabled class' do
      render_inline(described_class.new(link:, label: 'Submit', disabled: true))
      expect(page).to have_button('Submit', class: 'btn btn-primary disabled', disabled: true)
    end
  end

  context 'when not disabled' do
    it 'renders an enabled button without the disabled class' do
      render_inline(described_class.new(link:, label: 'Submit', disabled: false))
      expect(page).to have_button('Submit', class: 'btn btn-primary', disabled: false)
      expect(page).to have_no_button(class: 'disabled', disabled: :all)
    end
  end

  context 'with params' do
    it 'renders the button form with hidden fields for the params' do
      render_inline(described_class.new(link:, label: 'Submit', params: { foo: 'bar', baz: 'qux' }))
      expect(page).to have_field('foo', type: 'hidden', with: 'bar')
      expect(page).to have_field('baz', type: 'hidden', with: 'qux')
    end
  end
end
