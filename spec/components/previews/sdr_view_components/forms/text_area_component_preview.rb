# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class TextAreaComponentPreview < ViewComponent::Preview
      def default; end

      # @!group Help text
      def with_help_text; end

      def with_help_text_below; end
      # @!endgroup

      def with_hidden_label; end

      def with_mark_required; end

      def with_additional_container_content; end

      def with_validation_error; end

      class TextAreaPreviewModel
        include ActiveModel::Model
        include ActiveModel::Attributes

        attribute :description, :string, default: nil

        validates :description, presence: true
      end
    end
  end
end
