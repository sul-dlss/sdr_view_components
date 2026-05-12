# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class ToggleComponentPreview < ViewComponent::Preview
      def default; end

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
