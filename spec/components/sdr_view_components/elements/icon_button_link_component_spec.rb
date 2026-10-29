# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::IconButtonLinkComponent, type: :component do
  it 'renders the button' do
    render_inline(described_class.new(icon: :download, label: 'Download', link: 'http://www.example.com'))

    expect(page).to have_link('Download', href: 'http://www.example.com')
    expect(page).to have_css('a.icon-button')
    expect(page).to have_css('i.bi.bi-download')
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
end
