# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class SpinnerComponentPreview < ViewComponent::Preview
      # @!group Variants
      def default
        render SdrViewComponents::Elements::SpinnerComponent.new
      end

      def primary
        render SdrViewComponents::Elements::SpinnerComponent.new(variant: :primary)
      end

      def secondary
        render SdrViewComponents::Elements::SpinnerComponent.new(variant: :secondary)
      end

      def success
        render SdrViewComponents::Elements::SpinnerComponent.new(variant: :success)
      end

      def danger
        render SdrViewComponents::Elements::SpinnerComponent.new(variant: :danger)
      end

      def warning
        render SdrViewComponents::Elements::SpinnerComponent.new(variant: :warning)
      end

      def info
        render SdrViewComponents::Elements::SpinnerComponent.new(variant: :info)
      end
      # @!endgroup

      # @!group Messages
      def custom_message
        render SdrViewComponents::Elements::SpinnerComponent.new(message: 'Preparing deposit package...')
      end

      def hidden_message
        render SdrViewComponents::Elements::SpinnerComponent.new(
          message: 'Preparing deposit package...',
          hide_message: true
        )
      end
      # @!endgroup

      # @!group Message Position
      def message_on_bottom
        render SdrViewComponents::Elements::SpinnerComponent.new(
          message: 'Indexing files...',
          message_position: :bottom
        )
      end

      def message_on_top
        render SdrViewComponents::Elements::SpinnerComponent.new(
          message: 'Indexing files...',
          message_position: :top
        )
      end

      def message_on_left
        render SdrViewComponents::Elements::SpinnerComponent.new(
          message: 'Indexing files...',
          message_position: :left
        )
      end
      # @!endgroup

      def spinning_image
        render SdrViewComponents::Elements::SpinnerComponent.new(
          message: 'Uploading image derivatives...',
          image_path: "#{SdrViewComponents.configuration.component_library_url}/styles/Rosette.svg",
          height: 64,
          width: 64,
          speed: 1.5
        )
      end
    end
  end
end
