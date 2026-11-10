# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::IconButtonLinkComponent, type: :component do
  it 'renders the button' do
    render_inline(described_class.new(icon: :download, label: 'Download', link: 'http://www.example.com'))

    expect(page).to have_link('Download', href: 'http://www.example.com')
    expect(page).to have_css('a.icon-button')
    expect(page).to have_css('i.bi.bi-download[aria-hidden="true"]')
  end

  context 'with data' do
    it 'renders the button' do
      render_inline(described_class.new(icon: :download,
                                        label: 'Download',
                                        link: 'http://www.example.com',
                                        data: { controller: 'test' }))
      expect(page).to have_css('a[data-controller="test"]')
    end
  end

  context 'with classes' do
    it 'renders the button' do
      render_inline(described_class.new(icon: :download,
                                        label: 'Download',
                                        link: 'http://www.example.com',
                                        classes: %w[class1 class2]))
      expect(page).to have_css('.btn.class1.class2')
    end
  end

  context 'when disabled' do
    it 'renders an unfollowable button with the disabled class' do
      render_inline(described_class.new(icon: :download,
                                        label: 'Download',
                                        link: 'http://www.example.com',
                                        disabled: true))
      expect(page).to have_css('a.btn.disabled[aria-disabled="true"][tabindex="-1"]', text: 'Download')
      expect(page).to have_no_css('a[href]')
    end
  end

  context 'when not disabled' do
    it 'renders a followable button without the disabled class' do
      render_inline(described_class.new(icon: :download,
                                        label: 'Download',
                                        link: 'http://www.example.com',
                                        disabled: false))
      expect(page).to have_link('Download', href: 'http://www.example.com')
      expect(page).to have_no_css('.btn.disabled')
      expect(page).to have_no_css('a[aria-disabled], a[tabindex]')
    end
  end

  context 'without an icon' do
    it 'renders only the hidden label, for a button that draws its own icon' do
      render_inline(described_class.new(icon: nil, label: 'Remove', link: 'http://www.example.com',
                                        classes: 'btn-close', variant: nil))
      expect(page).to have_link('Remove', href: 'http://www.example.com', class: 'btn-close')
      expect(page).to have_no_css('i')
      expect(page).to have_no_css('.btn-outline-primary')
    end
  end

  context 'with an unknown icon' do
    it 'raises UnknownComponentIcon' do
      expect { render_inline(described_class.new(icon: :nonexistent, label: 'Download', link: '/path')) }
        .to raise_error(SdrViewComponents::Error::UnknownComponentIcon, /nonexistent/)
    end
  end
end
