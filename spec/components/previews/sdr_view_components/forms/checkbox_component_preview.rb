# frozen_string_literal: true

module SulViewComponents
  module Forms
    class CheckboxComponentPreview < ViewComponent::Preview
      def default
        # field_name = :test_checkbox
        # form_class = do
        #   Class.new(ApplicationForm) do
        #     attribute :test_checkbox, :boolean
        #   end
        # end
        test_form = form_class
        form = ActionView::Helpers::FormBuilder.new(nil, test_form, nil, {})
        render SdrViewComponents::Forms::CheckboxComponent.new(form:, field_name: :test_checkbox, label: 'Example Checkbox')
      end

      private

      def form_class
        Class.new(ApplicationForm) do
          attribute :test_checkbox, :boolean
        end
      end
    end
  end
end
