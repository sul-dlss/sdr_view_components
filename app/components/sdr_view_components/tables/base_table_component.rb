# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Base component for rendering a table.
    class BaseTableComponent < BaseComponent
      renders_many :headers, SdrViewComponents::Tables::HeaderComponent
      renders_one :caption
      # Subclasses should provide rows, e.g., renders_many :rows

      def initialize(label: nil, classes: [], head_classes: [], body_classes: [], show_label: true, # rubocop:disable Metrics/ParameterLists, Metrics/MethodLength
                     empty_message: nil, responsive: false, variant: :h3, **table_options)
        @classes = classes
        @body_classes = body_classes
        @label = label
        @show_label = show_label
        @empty_message = empty_message
        @head_classes = head_classes
        @responsive = responsive
        @table_options = table_options
        @variant = variant
        raise ArgumentError, 'Unknown variant' unless %i[h3 data].include?(@variant)

        raise ArgumentError, 'Subclasses must provide rows' unless respond_to?(:rows)

        super()
      end

      attr_reader :label, :empty_message, :table_options, :variant

      def before_render
        raise ArgumentError, 'Must provide label or caption' unless label.present? || caption?
      end

      def classes
        merge_classes(%w[table caption-top], variant_classes, @classes)
      end

      def head_classes
        merge_classes(@head_classes)
      end

      def body_classes
        merge_classes(@body_classes)
      end

      def show_label?
        @show_label
      end

      def render?
        rows? || empty_message.present?
      end

      def responsive?
        @responsive
      end

      def variant_classes
        case variant
        when :h3
          'table-h3'
        when :data
          'table-data table-striped table-hover table-bordered'
        end
      end
    end
  end
end
