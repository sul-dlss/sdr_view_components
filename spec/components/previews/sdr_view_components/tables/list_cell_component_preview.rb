# frozen_string_literal: true

module SdrViewComponents
  module Tables
    class ListCellComponentPreview < ViewComponent::Preview
      # @!group Item sources

      def with_item_values
        render_with_template(locals: {
                               item_values: ['Published', 'Preserved', 'Available in SearchWorks']
                             })
      end

      def with_items
        render_with_template(locals: {
                               items: [
                                 'Created by Digital Production Group',
                                 'Reviewed by Metadata Services',
                                 'Updated last week'
                               ]
                             })
      end

      # @!endgroup
    end
  end
end
