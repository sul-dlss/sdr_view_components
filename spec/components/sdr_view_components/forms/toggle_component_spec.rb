# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Forms::ToggleComponent, type: :component do
  let(:form) { build_form(test_model) }
  let(:test_model) { build_model(test_string_field:) }
  let(:test_string_field) { nil }
  let(:field_name) { :test_string_field }

  def build_component(**args)
    described_class.new(form:, field_name:, label_text: 'Test Toggle', **args).tap do |component|
      component.with_left_toggle_option(form:, field_name:, label: 'Type 1', value: 'type1', data: { test: 'test_data' })
      component.with_right_toggle_option(form:, field_name:, label: 'Type 2', value: 'type2',
                                         data: { test: 'more_test_data' })
    end
  end

  it 'creates toggle field with label' do
    render_inline(build_component)
    expect(page).to have_css('label.form-label:not(.visually-hidden)', text: 'Test Toggle')
    expect(page).to have_css('input[type="radio"]:not(.is-invalid)')
    expect(page).to have_css('input[data-test="test_data"]')
    expect(page).to have_css('label.btn.rounded-start-pill', text: 'Type 1')
    expect(page).to have_css('label.btn.rounded-end-pill', text: 'Type 2')
    expect(page).to have_no_css('p.form-text')
    expect(page).to have_no_css('div.invalid-feedback.is-invalid')
  end

  context 'when help text is provided' do
    it 'creates toggle field with help text' do
      render_inline(build_component(help_text: 'Helpful text'))

      expect(page).to have_css("input[aria-describedby='#{field_name}_help']")
      expect(page).to have_css("p.form-text[id='#{field_name}_help']", text: 'Helpful text')
    end
  end

  context 'when help text is configured below the toggle' do
    it 'renders the help text after the toggle buttons' do
      render_inline(build_component(help_text: 'Helpful text', variant: :help_text_below))

      expect(page).to have_css('div.btn-group.btn-group-toggle + div p.form-text', text: 'Helpful text')
    end
  end

  context 'when field has an error' do
    before do
      test_model.errors.add(field_name, 'must be selected')
    end

    it 'creates toggle field with invalid feedback' do
      render_inline(build_component)

      expect(page).to have_css(".btn-check.is-invalid[aria-invalid='true'][aria-describedby='#{field_name}_error']")
      expect(page).to have_css('div.invalid-feedback.is-invalid', text: 'must be selected')
    end
  end

  context 'with additional container content' do
    it 'renders the additional content inside the container' do
      component = build_component(container_classes: 'field-container')
      component.with_additional_container_content do
        "<span class='additional-content'>Extra Info</span>".html_safe
      end

      render_inline(component)

      expect(page).to have_css('div.field-container span.additional-content', text: 'Extra Info')
    end
  end
end
