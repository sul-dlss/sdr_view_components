# frozen_string_literal: true

module SdrViewComponents
  module Tables
    class RowComponentPreview < ViewComponent::Preview
      # @!group Values
      def with_values; end
      def with_value; end
      def with_cells; end
      def with_first_value_and_values; end
      # @!endgroup

      # @!group Labels
      def label_only; end
      def with_label_content; end
      # @!endgroup

      def with_tooltip; end
    end
  end
end
