# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::TabForm::HiddenFieldsFormComponent, type: :component do
  let(:component) { described_class.new(model:, id: 'tabbed_form', hidden_fields: %i[test_string_field], url: '#') }
  let(:model) { build_model(test_string_field: 'a value') }

  it 'renders a form with the given id and hidden fields' do
    render_inline(component)

    expect(page).to have_css('form#tabbed_form[novalidate]')
    expect(page).to have_css('form#tabbed_form input[type=hidden][name$="[test_string_field]"][value="a value"]',
                             visible: :all)
  end

  context 'with html_options' do
    let(:component) do
      described_class.new(model:, id: 'tabbed_form', hidden_fields: %i[test_string_field], url: '#',
                          html_options: { enctype: 'multipart/form-data' })
    end

    it 'renders a form with the given html options' do
      render_inline(component)

      expect(page).to have_css('form#tabbed_form[novalidate][enctype="multipart/form-data"]')
    end
  end
end
