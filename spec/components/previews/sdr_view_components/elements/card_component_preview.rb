# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class CardComponentPreview < ViewComponent::Preview
      # @!group Card Slots
      def default
        render SdrViewComponents::Elements::CardComponent.new
      end

      def with_header
        render SdrViewComponents::Elements::CardComponent.new do |card|
          card.with_header do
            'Card Header'
          end
        end
      end

      def with_body
        render SdrViewComponents::Elements::CardComponent.new do |card|
          card.with_body do
            'Card body content goes here.'
          end
        end
      end

      def with_header_and_body
        render SdrViewComponents::Elements::CardComponent.new do |card|
          card.with_header do
            'Card Header'
          end

          card.with_body do
            'Card body content goes here.'
          end
        end
      end
      # @!endgroup
    end
  end
end
