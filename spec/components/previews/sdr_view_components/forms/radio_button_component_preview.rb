# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class RadioButtonComponentPreview < ViewComponent::Preview
      def default; end

      def with_label; end

      # @!group Help text
      def with_help_text; end

      def with_help_text_below; end
      # @!endgroup

      def with_additional_container_content; end

      def with_validation_error; end

      class RadioButtonPreviewModel
        include ActiveModel::Model
        include ActiveModel::Attributes

        attribute :delivery_method, :string, default: nil

        validates :delivery_method, presence: true
      end
    end
  end
end
