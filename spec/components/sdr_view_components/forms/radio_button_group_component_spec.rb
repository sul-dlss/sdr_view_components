# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Forms::RadioButtonGroupComponent, type: :component do
  let(:form) { build_form(test_model) }
  let(:test_model) { build_model(test_string_field: 'value2') }
  let(:field_name) { :test_string_field }
  let(:component) { described_class.new(form:, field_name:, label: 'Test Group', data: { test: 'test_data' }) }

  before do
    component.with_radio_button(input_value: 'value1', label_text: 'Value 1')
    component.with_radio_button(input_value: 'value2', label_text: 'Value 2')
  end

  it 'creates a fieldset of radio buttons' do
    render_inline(component)
    expect(page).to have_css('fieldset.form-fieldset[data-test="test_data"] legend label', text: 'Test Group')
    expect(page).to have_css('fieldset input[type="radio"]#test_string_field_value1:not([checked])')
    expect(page).to have_css('fieldset input[type="radio"]#test_string_field_value2[checked]')
    expect(page).to have_css('label.form-check-label[for="test_string_field_value1"]', text: 'Value 1')
    expect(page).to have_no_css('input[aria-invalid]')
    expect(page).to have_no_css('div.invalid-feedback')
  end

  context 'when a radio button is given a block' do
    let(:component) { described_class.new(form:, field_name:, label: 'Test Group') }

    before do
      component.with_radio_button(input_value: 'value3', label_text: 'Value 3') do
        '<p class="nested">Nested content</p>'.html_safe
      end
    end

    it 'renders the block as that radio button\'s additional container content' do
      render_inline(component)
      expect(page).to have_css('div.form-check:has(input#test_string_field_value3) > p.nested',
                               text: 'Nested content', count: 1)
      expect(page).to have_css('p.nested', count: 1)
    end
  end

  context 'when field has an error' do
    before do
      test_model.errors.add(field_name, 'is required')
    end

    it 'renders the error once, with the radio buttons described by it' do
      render_inline(component)
      expect(page).to have_css('div.invalid-feedback.is-invalid', text: 'is required', count: 1)
      expect(page).to have_css('#test_string_field_error', count: 1)
      expect(page).to have_css('input[type="radio"][aria-invalid="true"][aria-describedby="test_string_field_error"]',
                               count: 2)
    end
  end
end
