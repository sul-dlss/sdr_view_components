# frozen_string_literal: true

module SdrViewComponents
  module Tables
    class TableComponentPreview < ViewComponent::Preview
      # @!group Variants

      def h3_variant
        render(SdrViewComponents::Tables::TableComponent.new(label: 'Sample Data')) do |component|
          component.with_row(label: 'Item 1', values: ['Value A', 'Value B', 'Value C'])
          component.with_row(label: 'Item 2', values: ['Value D', 'Value E', 'Value F'])
          component.with_row(label: 'Item 3', values: ['Value G', 'Value H', 'Value I'])
        end
      end

      def data_variant
        render(SdrViewComponents::Tables::TableComponent.new(label: 'Data Records', variant: :data)) do |component|
          component.with_row(label: 'Record 1', values: %w[Alpha Beta Gamma])
          component.with_row(label: 'Record 2', values: %w[Delta Epsilon Zeta])
          component.with_row(label: 'Record 3', values: %w[Eta Theta Iota])
        end
      end

      # @!endgroup

      # @!group Headers and Caption

      def with_headers
        render(SdrViewComponents::Tables::TableComponent.new(label: 'Headers Example')) do |component|
          component.with_header(label: 'Column 1')
          component.with_header(label: 'Column 2')
          component.with_header(label: 'Column 3')
          component.with_row(label: 'Row 1', values: ['Data 1', 'Data 2', 'Data 3'])
          component.with_row(label: 'Row 2', values: ['Data 4', 'Data 5', 'Data 6'])
        end
      end

      def with_caption
        render(SdrViewComponents::Tables::TableComponent.new) do |component|
          component.with_caption { 'Table Caption: Financial Summary' }
          component.with_header(label: 'Month')
          component.with_header(label: 'Revenue')
          component.with_header(label: 'Expenses')
          component.with_row(label: 'January', values: ['$50,000', '$35,000'])
          component.with_row(label: 'February', values: ['$55,000', '$38,000'])
        end
      end

      def show_label_false
        render(SdrViewComponents::Tables::TableComponent.new(label: 'This label is hidden',
                                                             show_label: false)) do |component|
          component.with_row(label: 'Data Row', values: ['Value 1', 'Value 2', 'Value 3'])
        end
      end

      # @!endgroup

      def empty_message
        render(SdrViewComponents::Tables::TableComponent.new(
                 label: 'No Data Available',
                 empty_message: 'No records found. Please try again later.'
               ))
      end

      def responsive # rubocop:disable Metrics/MethodLength
        render(SdrViewComponents::Tables::TableComponent.new(
                 label: 'Responsive Table',
                 responsive: true
               )) do |component|
          component.with_header(label: 'Row')
          component.with_header(label: 'Column 1')
          component.with_header(label: 'Column 2')
          component.with_header(label: 'Column 3')
          component.with_header(label: 'Column 4')
          component.with_row(label: 'Row 1', values: ['Data 1', 'Data 2', 'Data 3', 'Data 4'])
          component.with_row(label: 'Row 2', values: ['Data 5', 'Data 6', 'Data 7', 'Data 8'])
        end
      end
    end
  end
end
