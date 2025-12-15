# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Forms::SubmitComponent, type: :component do
  let(:form) { build_form(test_model) }
  let(:test_model) { build_model }

  context 'with a label' do
    it 'renders the submit button' do
      render_inline(described_class.new(form:, label: 'Deposit'))
      expect(page).to have_button(value: 'Deposit', type: 'submit', name: 'commit')
    end
  end

  context 'with content and a value' do
    it 'renders the submit button' do
      render_inline(described_class.new(form:, value: 'deposit-value').with_content('Deposit'))
      expect(page).to have_button('Deposit', value: 'deposit-value', type: 'submit', name: 'commit')
    end
  end
end
