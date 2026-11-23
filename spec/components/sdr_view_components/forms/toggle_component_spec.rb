# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Forms::ToggleComponent, type: :component do
  let(:form) { build_form(test_model) }
  let(:test_model) { build_model }
  let(:field_name) { :test_boolean_field }
  let(:label_text) { 'Test Toggle' }
  let(:component) { described_class.new(form:, field_name:, label_text:, container_classes: 'field-container') }

  before do
    component.with_left_toggle_option(form:, field_name:, label: 'Type 1', value: 'type1', data: { test: 'test_data' })
    component.with_right_toggle_option(form:, field_name:, label: 'Type 2', value: 'type2',
                                       data: { test: 'more_test_data' })
  end

  it 'creates toggle field with label' do
    render_inline(component)
    expect(page).to have_css('label.form-label:not(.visually-hidden)', text: 'Test Toggle')
    expect(page).to have_css('input[type="radio"]:not(.is-invalid)')
    expect(page).to have_css('input[data-test="test_data"]')
    expect(page).to have_css('label.btn', text: 'Type 1')
    expect(page).to have_css('label.btn', text: 'Type 2')
    expect(page).to have_no_css('label.btn.rounded-start-pill, label.btn.rounded-end-pill')
    expect(page).to have_no_css('p.form-text')
    expect(page).to have_no_css('div.invalid-feedback.is-invalid')
    expect(page).to have_css('div.toggle-radio.field-container .btn-group')
  end

  it 'labels the radio group with the label' do
    render_inline(component)
    label_id = page.find('label.form-label', text: 'Test Toggle')[:id]
    expect(label_id).to be_present
    expect(page).to have_css(".btn-group[role='group'][aria-labelledby='#{label_id}']")
  end

  context 'when an option overrides the checked state' do
    let(:component) { described_class.new(form:, field_name:, label_text:) }

    before do
      component.with_left_toggle_option(form:, field_name:, label: 'Type 1', value: 'type1', checked: false)
      component.with_right_toggle_option(form:, field_name:, label: 'Type 2', value: 'type2', checked: true)
    end

    it 'checks the option' do
      render_inline(component)
      expect(page).to have_checked_field('Type 2')
      expect(page).to have_unchecked_field('Type 1')
    end
  end
end
