# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class ProgressBarComponentPreview < ViewComponent::Preview
      # @!group Variants
      def default
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'Digitization progress',
          percent: 45
        )
      end

      def primary
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'Digitization progress',
          percent: 45,
          variant: :primary
        )
      end

      def secondary
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'Digitization progress',
          percent: 45,
          variant: :secondary
        )
      end

      def success
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'Digitization progress',
          percent: 45,
          variant: :success
        )
      end

      def danger
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'Digitization progress',
          percent: 45,
          variant: :danger
        )
      end

      def warning
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'Digitization progress',
          percent: 45,
          variant: :warning
        )
      end

      def info
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'Digitization progress',
          percent: 45,
          variant: :info
        )
      end
      # @!endgroup

      # @!group Percent Complete
      def twenty_five_percent
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'File transfer progress',
          percent: 25
        )
      end

      def complete
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'File transfer progress',
          percent: 100
        )
      end
      # @!endgroup

      # @!group Striping
      def striped
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'Metadata review progress',
          percent: 60
        )
      end

      def solid
        render SdrViewComponents::Elements::ProgressBarComponent.new(
          label: 'Metadata review progress',
          percent: 60,
          striped: false
        )
      end
      # @!endgroup
    end
  end
end
