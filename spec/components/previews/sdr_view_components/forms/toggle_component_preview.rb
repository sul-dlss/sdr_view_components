# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class ToggleComponentPreview < ViewComponent::Preview
      def default; end

      # @!group Help text
      def with_help_text; end

      def with_help_text_below; end
      # @!endgroup

      def with_additional_container_content; end

      def with_validation_error; end

      class TogglePreviewModel
        include ActiveModel::Model
        include ActiveModel::Attributes

        attribute :audience, :string, default: 'collections'

        validates :audience, presence: true
      end
    end
  end
end
