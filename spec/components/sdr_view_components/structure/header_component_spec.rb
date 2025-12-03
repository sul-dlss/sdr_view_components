# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Structure::HeaderComponent, type: :component do
  it 'renders header' do
    render_inline(described_class.new(title: 'Test Header', subtitle: 'Test Subtitle'))

    expect(page).to have_text('Test Header')
    expect(page).to have_text('Test Subtitle')
  end
end
