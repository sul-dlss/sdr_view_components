# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class ButtonLinkComponentPreview < ViewComponent::Preview
      # @!group Button Variants
      def primary
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Primary Link Button',
                                                                    variant: :primary)
      end

      def secondary
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Secondary Link Button',
                                                                    variant: :secondary)
      end

      def success
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Success Link Button',
                                                                    variant: :success)
      end

      def danger
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Danger Link Button',
                                                                    variant: :danger)
      end

      def warning
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Warning Link Button',
                                                                    variant: :warning)
      end

      def info
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Info Link Button',
                                                                    variant: :info)
      end

      def nil
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Nil Variant Link Button',
                                                                    variant: nil)
      end

      # @!endgroup

      # @!group Button Sizes
      def small
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Small Link Button',
                                                                    variant: :primary, size: 'sm')
      end

      def large
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Large Link Button',
                                                                    variant: :primary, size: 'lg')
      end
      # @!endgroup

      # @!group Borderless
      def borderless
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Borderless Link Button',
                                                                    variant: :primary, bordered: false)
      end

      def borderless_secondary
        render SdrViewComponents::Elements::ButtonLinkComponent
          .new(link: '/example',
               label: 'Borderless Secondary Link Button', variant: :secondary, bordered: false)
      end
      # @!endgroup

      # @!group Content Options
      def with_label
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Label Link Button',
                                                                    variant: :primary)
      end

      def with_block_content
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', variant: :primary) do
          'Link Button with Block Content'
        end
      end
      # @!endgroup

      def default
        render SdrViewComponents::Elements::ButtonLinkComponent.new(link: '/example', label: 'Default Link Button')
      end
    end
  end
end
