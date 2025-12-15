# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Forms::TextFieldComponent, type: :component do
  let(:form) { build_form(test_model) }
  let(:test_model) { build_model(test_string_field:) }
  let(:test_string_field) { 'title' }
  let(:field_name) { :test_string_field }

  it 'creates field with label' do
    render_inline(described_class.new(form:, field_name:))
    expect(page).to have_css('label.form-label:not(.visually-hidden)', text: field_name)
    expect(page).to have_css('input.form-control[type="text"]:not(.is-invalid)')
    expect(page).to have_no_css('p.form-text')
    expect(page).to have_no_css('div.invalid-feedback.is-invalid')
    expect(page).to have_css('div.field-container', visible: :visible)
  end

  context 'when label is hidden' do
    it 'creates field with hidden label' do
      render_inline(described_class.new(form:, field_name:, label_hidden: true))
      expect(page).to have_css('label.form-label.visually-hidden', text: field_name)
    end
  end

  context 'when help text is provided' do
    it 'creates field with help text' do
      render_inline(described_class.new(form:, field_name:, help_text: 'Helpful text'))
      expect(page).to have_css('input[aria-describedby="test_string_field_help"]')
      expect(page).to have_css('p.form-text[id="test_string_field_help"]', text: 'Helpful text')
    end
  end

  context 'when disabled is set to true' do
    it 'renders the text field as disabled' do
      render_inline(described_class.new(form:, field_name:, input_disabled: true))
      expect(page.find('input.form-control[type="text"]')).to be_disabled
    end
  end

  context 'when the field container hidden is set to true' do
    it 'renders the containing div as hidden' do
      render_inline(described_class.new(form:, field_name:, container_hidden: true))
      expect(page).to have_css('div.field-container', visible: :hidden)
    end
  end

  context 'when field has an error' do
    before do
      test_model.errors.add(field_name, 'is required')
    end

    it 'creates field with invalid feedback' do
      render_inline(described_class.new(form:, field_name:))

      expect(page).to have_css('.form-control.is-invalid[aria-invalid="true"][aria-describedby="test_string_field_error"]')
      expect(page).to have_css('div.invalid-feedback.is-invalid', text: 'is required')
    end
  end

  context 'when input data is provided' do
    it 'creates field with data' do
      render_inline(described_class.new(form:, field_name:, input_data: { test: 'test_data' }))
      expect(page).to have_css('input[data-test="test_data"]')
    end
  end

  context 'when placeholder is provided' do
    it 'creates field with placeholder' do
      render_inline(described_class.new(form:, field_name:, input_placeholder: 'My placeholder'))
      expect(page).to have_css('input[placeholder="My placeholder"]')
    end
  end

  context 'when field is required (client-side validation)' do
    it 'creates input with required attribute' do
      render_inline(described_class.new(form:, field_name:, input_required: true))
      expect(page).to have_css('input[required]')
    end
  end

  context 'when field is marked as required (server-side validation)' do
    it 'creates input with aria-required attribute' do
      render_inline(described_class.new(form:, field_name:, mark_required: true))
      expect(page).to have_css('input[aria-required="true"]')
    end
  end
end
