# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class CheckboxComponentPreview < ViewComponent::Preview
      def default; end

      # @!group Checkbox State
      def checked; end

      def disabled; end
      # @!endgroup

      def with_label; end

      # Help text can only be put below a checkbox.
      def with_help_text; end

      def with_validation_error; end

      def with_additional_container_content; end

      class CheckboxPreviewModel
        include ActiveModel::Model
        include ActiveModel::Attributes

        attribute :test_boolean_field, :boolean, default: false

        validates :test_boolean_field, acceptance: true
      end
    end
  end
end
