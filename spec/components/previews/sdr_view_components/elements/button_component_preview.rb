# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class ButtonComponentPreview < ViewComponent::Preview
      # @!group Button Variants
      def primary
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Primary', variant: 'primary')
      end

      def secondary
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Secondary', variant: 'secondary')
      end

      def success
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Success', variant: 'success')
      end

      def danger
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Danger', variant: 'danger')
      end

      def warning
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Warning', variant: 'warning')
      end

      def info
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Info', variant: 'info')
      end
      # @!endgroup

      # @!group Button Sizes
      def small
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Small Button', variant: 'primary', size: 'sm')
      end

      def large
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Large Button', variant: 'primary', size: 'lg')
      end
      # @!endgroup

      # @!group Borderless
      def borderless
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Borderless Button', variant: 'primary',
                                                                bordered: false)
      end

      def borderless_secondary
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Borderless Secondary', variant: 'secondary',
                                                                bordered: false)
      end
      # @!endgroup

      # @!group Content Options
      def with_label
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Button with Label', variant: 'primary')
      end

      def with_block_content
        render SdrViewComponents::Elements::ButtonComponent.new(variant: 'primary') do
          'Button with Block Content'
        end
      end
      # @!endgroup

      def default
        render SdrViewComponents::Elements::ButtonComponent.new(label: 'Default Button')
      end
    end
  end
end
