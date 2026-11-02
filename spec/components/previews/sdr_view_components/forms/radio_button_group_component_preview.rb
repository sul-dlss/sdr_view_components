# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class RadioButtonGroupComponentPreview < ViewComponent::Preview
      def default; end

      def with_validation_error; end

      def with_nested_content; end

      class RadioButtonGroupPreviewModel
        include ActiveModel::Model
        include ActiveModel::Attributes

        attribute :delivery_method, :string, default: nil
        attribute :email_address, :string, default: nil

        validates :delivery_method, presence: true
      end
    end
  end
end
