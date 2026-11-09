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

      # A button whose classes draw its own icon.
      def without_icon
        render SdrViewComponents::Elements::IconButtonLinkComponent.new(
          icon: nil,
          label: 'Remove item',
          link: '/example',
          classes: 'btn-close',
          variant: nil
        )
      end

      # @!group Disabled State
      def enabled
        render SdrViewComponents::Elements::IconButtonLinkComponent.new(
          icon: :download,
          label: 'Download item',
          link: '/example',
          disabled: false
        )
      end

      def disabled
        render SdrViewComponents::Elements::IconButtonLinkComponent.new(
          icon: :download,
          label: 'Download item',
          link: '/example',
          disabled: true
        )
      end
      # @!endgroup
    end
  end
end
