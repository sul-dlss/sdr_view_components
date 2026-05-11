# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class ButtonFormComponentPreview < ViewComponent::Preview
      # @!group Button Variants
      def primary
        render SdrViewComponents::Elements::ButtonFormComponent.new(link: '/action', label: 'Primary Form Button',
                                                                    variant: :primary)
      end

      def secondary
        render SdrViewComponents::Elements::ButtonFormComponent.new(link: '/action', label: 'Secondary Form Button',
                                                                    variant: :secondary)
      end

      def success
        render SdrViewComponents::Elements::ButtonFormComponent.new(link: '/action', label: 'Success Action',
                                                                    variant: :success)
      end

      def danger
        render SdrViewComponents::Elements::ButtonFormComponent.new(link: '/action', label: 'Delete Item', variant: :danger)
      end

      def warning
        render SdrViewComponents::Elements::ButtonFormComponent.new(link: '/action', label: 'Warning Action',
                                                                    variant: :warning)
      end

      def info
        render SdrViewComponents::Elements::ButtonFormComponent.new(link: '/action', label: 'Information Action',
                                                                    variant: :info)
      end
      # @!endgroup

      # @!group With Confirmation
      def with_confirmation
        render SdrViewComponents::Elements::ButtonFormComponent.new(
          link: '/delete-item',
          label: 'Delete (with confirmation)',
          variant: :danger,
          confirm: 'Are you sure you want to delete this item?'
        )
      end

      def without_confirmation
        render SdrViewComponents::Elements::ButtonFormComponent.new(
          link: '/action',
          label: 'Action (no confirmation)',
          variant: :primary
        )
      end
      # @!endgroup

      # @!group Turbo Frame Behavior
      def turbo_frame_top
        render SdrViewComponents::Elements::ButtonFormComponent.new(
          link: '/submit',
          label: 'Submit (reload top)',
          variant: :primary,
          top: true
        )
      end

      def turbo_frame_scoped
        render SdrViewComponents::Elements::ButtonFormComponent.new(
          link: '/submit',
          label: 'Submit (scoped frame)',
          variant: :primary,
          top: false
        )
      end
      # @!endgroup

      # @!group Content Options
      def with_label
        render SdrViewComponents::Elements::ButtonFormComponent.new(
          link: '/action',
          label: 'Button with Label',
          variant: :primary
        )
      end

      def with_block_content
        render SdrViewComponents::Elements::ButtonFormComponent.new(link: '/action', variant: :primary) do
          'Button with Block Content'
        end
      end
      # @!endgroup

      def default
        render SdrViewComponents::Elements::ButtonFormComponent.new(link: '/', label: 'Form Button')
      end
    end
  end
end
