# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class AlertComponentPreview < ViewComponent::Preview
      # @!group Variants
      def default
        render SdrViewComponents::Elements::AlertComponent.new(title: 'Information', variant: :info) do
          'This is an informational alert.'
        end
      end

      def danger
        render SdrViewComponents::Elements::AlertComponent.new(title: 'Error', variant: :danger) do
          'This is a danger alert.'
        end
      end

      def success
        render SdrViewComponents::Elements::AlertComponent.new(title: 'Success', variant: :success) do
          'This is a success alert.'
        end
      end

      def note
        render SdrViewComponents::Elements::AlertComponent.new(title: 'Note', variant: :note) do
          'This is a note alert.'
        end
      end

      def warning
        render SdrViewComponents::Elements::AlertComponent.new(title: 'Warning', variant: :warning) do
          'This is a warning alert.'
        end
      end

      def input
        render SdrViewComponents::Elements::AlertComponent.new(title: 'Input Required', variant: :input) do
          'This is an input validation alert.'
        end
      end
      # @!endgroup

      def with_title_only
        render SdrViewComponents::Elements::AlertComponent.new(title: 'Alert Title Only') do
          'Content goes here.'
        end
      end

      def dismissible_alert
        render SdrViewComponents::Elements::AlertComponent.new(title: 'Dismissible Alert', dismissible: true) do
          'Click the X button to dismiss this alert.'
        end
      end

      # @!group Content Options
      def with_text_property
        render SdrViewComponents::Elements::AlertComponent
          .new(title: 'Using Text Property',
               text: 'This alert uses the text parameter instead of block content.')
      end

      def with_block_content
        render SdrViewComponents::Elements::AlertComponent.new(title: 'Using Block Content') do
          'This alert uses block content, which can include HTML or other components.'
        end
      end
      # @!endgroup
    end
  end
end
