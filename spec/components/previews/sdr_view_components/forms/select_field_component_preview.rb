# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class SelectFieldComponentPreview < ViewComponent::Preview
      def default; end

      def with_prompt; end

      # @!group Help text
      def with_help_text; end

      def with_help_text_below; end
      # @!endgroup

      def with_additional_container_content; end

      def with_validation_error; end

      class SelectFieldPreviewModel
        include ActiveModel::Model
        include ActiveModel::Attributes

        attribute :resource_type, :string, default: nil

        validates :resource_type, presence: true
      end
    end
  end
end
