# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class IconButtonFormComponentPreview < ViewComponent::Preview
      def default
        render SdrViewComponents::Elements::IconButtonFormComponent.new(link: '/example', icon: :download,
                                                                        label: 'Download item')
      end

      def with_confirmation
        render SdrViewComponents::Elements::IconButtonFormComponent.new(
          link: '/delete-item',
          icon: :delete,
          label: 'Delete item',
          method: :delete,
          confirm: 'Are you sure you want to delete this item?'
        )
      end

      # @!group Button Sizes
      def small
        render SdrViewComponents::Elements::IconButtonFormComponent.new(link: '/example', icon: :download,
                                                                        label: 'Download item', size: :sm)
      end

      def large
        render SdrViewComponents::Elements::IconButtonFormComponent.new(link: '/example', icon: :download,
                                                                        label: 'Download item', size: :lg)
      end
      # @!endgroup

      # @!group Disabled State
      def enabled
        render SdrViewComponents::Elements::IconButtonFormComponent.new(link: '/example', icon: :download,
                                                                        label: 'Download item', disabled: false)
      end

      def disabled
        render SdrViewComponents::Elements::IconButtonFormComponent.new(link: '/example', icon: :download,
                                                                        label: 'Download item', disabled: true)
      end
      # @!endgroup
    end
  end
end
