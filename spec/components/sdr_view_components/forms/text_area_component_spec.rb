# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Forms::TextAreaComponent, type: :component do
  let(:form) { build_form(test_model) }
  let(:test_model) { build_model(test_string_field:) }
  let(:test_string_field) { 'title' }
  let(:field_name) { :test_string_field }

  it 'creates field with label' do
    render_inline(described_class.new(form:, field_name:))
    expect(page).to have_css('label.form-label:not(.visually-hidden)', text: field_name)
    expect(page).to have_css('textarea.form-control:not(.is-invalid)')
    expect(page).to have_no_css('p.form-text')
    expect(page).to have_no_css('div.invalid-feedback.is-invalid')
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
      expect(page).to have_css('textarea[aria-describedby="test_string_field_help"]')
      expect(page).to have_css('p.form-text[id="test_string_field_help"]', text: 'Helpful text')
    end
  end

  context 'when field has an error' do
    before do
      test_model.errors.add(field_name, 'is required')
    end

    it 'creates field with invalid feedback' do
      render_inline(described_class.new(form:, field_name:))

      expect(page).to have_css('textarea.form-control.is-invalid')
      expect(page).to have_css('div.invalid-feedback.is-invalid', text: 'is required')
    end
  end

  context 'when data is provided' do
    it 'creates field with data' do
      render_inline(described_class.new(form:, field_name:, input_data: { test: 'test_data' }))
      expect(page).to have_css('textarea[data-test="test_data"]')
    end
  end
end
