# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::TooltipComponent, type: :component do
  let(:target_label) { 'My field' }
  let(:tooltip) { 'Tooltip text' }

  it 'renders the tooltip when tooltip text is present' do
    render_inline(described_class.new(target_label:, tooltip:))
    expect(page).to have_css('.tooltip-info[data-bs-title="Tooltip text"]')
  end

  it 'does not render the tooltip when tooltip text is absent' do
    render_inline(described_class.new(target_label:, tooltip: nil))
    expect(page).to have_no_css('.tooltip-info')
  end

  it 'gives the tooltip a name using the target label' do
    render_inline(described_class.new(target_label:, tooltip:))
    expect(page).to have_css('.tooltip-info[aria-label="More information for My field"]')
  end

  it 'hides the decorative icon from assistive technology' do
    render_inline(described_class.new(target_label:, tooltip:))
    expect(page).to have_css('.tooltip-info i.bi.bi-info-circle-fill[aria-hidden="true"]')
  end

  it 'adds custom data to the tooltip' do
    render_inline(described_class.new(target_label:, tooltip:, data: { custom: 'value' }))
    expect(page).to have_css('.tooltip-info[data-custom="value"]')
  end
end
