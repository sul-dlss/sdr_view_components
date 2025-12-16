# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for rendering an image, enforcing alt text.
    class ImageComponent < BaseComponent
      # param src [String] the image source URL
      # param alt [String] the alt text for the image (required)
      # param classes [String, nil] optional CSS classes to add to the image tag
      # raise ArgumentError if alt text is not provided
      def initialize(src:, alt:, classes: nil)
        raise ArgumentError, 'Alt text must be provided' if alt.blank?

        @src = src
        @alt = alt
        @classes = classes
        super()
      end

      attr_reader :alt, :classes, :src

      def call
        tag.img(src:, alt: alt, class: classes)
      end
    end
  end
end
