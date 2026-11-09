# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Structure::FooterComponent, type: :component do
  it 'renders footer' do
    render_inline(described_class.new)

    expect(page).to have_css('footer')
  end

  it 'hides the decorative link arrows from assistive technology' do
    render_inline(described_class.new)

    expect(page).to have_link('Library website')
    expect(page).to have_css('a i.bi-arrow-right-short', count: 3)
    expect(page).to have_no_css('a i.bi-arrow-right-short:not([aria-hidden="true"])')
  end
end
