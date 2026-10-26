# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::IconButtonFormComponent, type: :component do
  let(:link) { '/path' }

  it 'renders the icon button form' do
    render_inline(described_class.new(link:, icon: :delete, label: 'Delete'))
    form = page.find('form[data-turbo-frame="_top"][method="get"][action="/path"]')
    expect(form).to have_button(class: 'btn btn-outline-primary icon-button', type: 'submit')
    expect(form).to have_css('span.visually-hidden', text: 'Delete')
    expect(form).to have_css('i.bi.bi-trash')
  end

  context 'with a variant' do
    it 'renders the icon button form' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', variant: :danger))
      expect(page).to have_button(class: 'btn btn-danger')
    end
  end

  context 'with a size' do
    it 'renders the icon button form' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', size: :sm))
      expect(page).to have_button(class: 'btn btn-outline-primary btn-sm')
    end
  end

  context 'with classes' do
    it 'renders the icon button form' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', classes: %w[class1 class2]))
      expect(page).to have_button(class: 'btn btn-outline-primary icon-button border border-0 class1 class2')
    end
  end

  context 'with a confirm message' do
    it 'renders the icon button form' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', confirm: 'Are you sure?'))
      expect(page).to have_css('form[data-turbo-confirm="Are you sure?"]')
    end
  end

  context 'with a method' do
    it 'renders the icon button form' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', method: :delete))
      expect(page).to have_css('form[method="post"]')
      expect(page).to have_field('_method', type: 'hidden', with: 'delete')
    end
  end

  context 'when top is false' do
    it 'renders the icon button form without data-turbo-frame' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', top: false))
      expect(page).to have_css('form')
      expect(page).to have_no_css('form[data-turbo-frame="_top"]')
    end
  end

  context 'with data' do
    it 'renders the icon button form' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', data: { turbo_foo: 'bar' }))
      expect(page).to have_css('form[data-turbo-foo="bar"][data-turbo-frame="_top"]')
    end
  end

  context 'when disabled' do
    it 'renders the button with the disabled class' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', disabled: true))
      expect(page).to have_button(class: 'btn btn-outline-primary disabled')
    end
  end

  context 'when not disabled' do
    it 'renders the button without the disabled class' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', disabled: false))
      expect(page).to have_no_button(class: 'disabled')
    end
  end

  context 'with params' do
    it 'renders the icon button form with hidden fields for the params' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', params: { foo: 'bar', baz: 'qux' }))
      expect(page).to have_field('foo', type: 'hidden', with: 'bar')
      expect(page).to have_field('baz', type: 'hidden', with: 'qux')
    end
  end

  context 'with icon_classes' do
    it 'renders the icon with the additional classes' do
      render_inline(described_class.new(link:, icon: :delete, label: 'Delete', icon_classes: %w[icon-class]))
      expect(page).to have_css('i.bi.bi-trash.icon-class')
    end
  end

  context 'with an unknown icon' do
    it 'raises UnknownComponentIcon' do
      expect { render_inline(described_class.new(link:, icon: :nonexistent, label: 'Delete')) }
        .to raise_error(SdrViewComponents::Error::UnknownComponentIcon, /nonexistent/)
    end
  end
end
