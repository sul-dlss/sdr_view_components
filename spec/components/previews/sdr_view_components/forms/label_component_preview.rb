# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class LabelComponentPreview < ViewComponent::Preview
      def default; end

      # @!group Label options
      def hidden_label; end

      def with_tooltip; end

      def with_caption; end
      # @!endgroup
    end
  end
end
