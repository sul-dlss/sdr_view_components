# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class SubmitComponentPreview < ViewComponent::Preview
      # @!group Button Variants
      def primary; end

      def secondary; end

      def success; end

      def danger; end

      def warning; end

      def info; end
      # @!endgroup

      # @!group Content Options
      def with_block_content_and_value; end
      # @!endgroup

      def with_form_id; end

      def default; end
    end
  end
end
