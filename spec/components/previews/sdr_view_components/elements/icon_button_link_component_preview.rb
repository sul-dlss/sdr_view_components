# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class IconButtonLinkComponentPreview < ViewComponent::Preview
      def default
        render SdrViewComponents::Elements::IconButtonLinkComponent.new(
          icon: :download,
          label: 'Download item',
          link: '/example'
        )
      end
    end
  end
end
