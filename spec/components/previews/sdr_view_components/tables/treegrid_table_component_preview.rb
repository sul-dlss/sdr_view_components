# frozen_string_literal: true

module SdrViewComponents
  module Tables
    class TreegridTableComponentPreview < ViewComponent::Preview
      FILES = [
        { path_parts: [], label: 'README.txt', size: '1 KB' },
        { path_parts: %w[images], label: 'image1.tif', size: '10 MB' },
        { path_parts: %w[images], label: 'image2.tif', size: '12 MB' },
        { path_parts: %w[images thumbnails], label: 'image1.jpg', size: '20 KB' },
        { path_parts: %w[data], label: 'data.csv', size: '3 MB' }
      ].freeze

      def default
        render_with_template(locals: { files: FILES, collapsed: false })
      end

      def collapsed
        render_with_template(template: 'sdr_view_components/tables/treegrid_table_component_preview/default',
                             locals: { files: FILES, collapsed: true })
      end
    end
  end
end
