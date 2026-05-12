# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class IconButtonComponentPreview < ViewComponent::Preview
      # @!group Icon Buttons
      def delete
        render SdrViewComponents::Elements::IconButtonComponent.new(icon: :delete, label: 'Delete item')
      end

      def download
        render SdrViewComponents::Elements::IconButtonComponent.new(icon: :download, label: 'Download file')
      end
      # @!endgroup
    end
  end
end
