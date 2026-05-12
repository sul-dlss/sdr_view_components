# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class FileComponentPreview < ViewComponent::Preview
      def default; end

      def with_label; end

      # @!group Help text
      def with_help_text; end

      def with_help_text_below; end
      # @!endgroup

      def with_multiple; end

      def with_additional_container_content; end

      def with_validation_error; end

      class FilePreviewModel
        include ActiveModel::Model
        include ActiveModel::Attributes

        attribute :document, :string, default: nil

        validates :document, presence: true
      end
    end
  end
end
