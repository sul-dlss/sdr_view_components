# frozen_string_literal: true

module FormBuilder
  def build_form(model)
    ActionView::Helpers::FormBuilder.new(nil, model, vc_test_view_context, {})
  end
end
