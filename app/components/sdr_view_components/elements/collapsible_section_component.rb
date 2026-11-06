# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a section whose heading toggles (Bootstrap collapse) the display of its content.
    class CollapsibleSectionComponent < BaseComponent
      renders_one :heading_content # alternative to the heading argument

      def initialize(id:, heading: nil, level: :h2, expanded: true, classes: [], heading_classes: []) # rubocop:disable Metrics/ParameterLists
        @id = id
        @heading = heading
        @level = level
        @expanded = expanded
        @classes = classes
        @heading_classes = heading_classes
        super()
      end

      attr_reader :id, :heading, :level, :expanded, :heading_classes

      def before_render
        raise ArgumentError, 'Must provide heading or heading_content' unless heading.present? || heading_content?
      end

      def classes
        merge_classes('collapsible-section', @classes)
      end

      def toggle_classes
        merge_classes('collapsible-section-toggle', expanded ? nil : 'collapsed')
      end

      def collapse_classes
        merge_classes('collapse', expanded ? 'show' : nil)
      end
    end
  end
end
