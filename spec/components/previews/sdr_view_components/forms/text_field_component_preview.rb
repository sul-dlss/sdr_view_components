# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class TextFieldComponentPreview < ViewComponent::Preview
      def default; end

      def label_hidden; end

      # @!group Help text
      def with_help_text; end

      def with_help_text_below; end
      # @!endgroup

      # @!group Input Options
      def with_placeholder; end

      def disabled; end

      def required; end

      def marked_required; end
      # @!endgroup

      def with_additional_container_content; end

      def with_validation_error; end

      class TextFieldPreviewModel
        include ActiveModel::Model
        include ActiveModel::Attributes

        attribute :title, :string, default: nil

        validates :title, presence: true
      end
    end
  end
end
