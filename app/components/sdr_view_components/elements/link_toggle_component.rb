# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a toggle-like group of links, e.g., for switching between views of the same page.
    #
    # Switching views is navigation, not data entry, so this renders links rather than a radio group
    # The design mirrors Forms::ToggleComponent so the .toggle-radio
    # styles apply to the links, with .active (and aria-current) in place of :checked.
    class LinkToggleComponent < BaseComponent
      # @param links [Array<Hash>] one entry per link, with :label, :path and :selected (Boolean);
      #   any other keys are passed on to link_to
      # @param label [String] the accessible name of the group (e.g., 'Select view')
      # @param classes [Array<String>, String] additional classes for the container
      def initialize(links:, label:, classes: [])
        @links = links
        @label = label
        @classes = classes
        super()
      end

      attr_reader :links, :label

      def container_classes
        merge_classes('toggle-radio', @classes)
      end

      # @return [Hash] the link_to options for a link
      def link_options(link)
        link.except(:label, :path, :selected).merge(
          class: merge_classes('btn rounded-pill', link[:selected] ? 'active' : nil),
          'aria-current': link[:selected] ? 'page' : nil
        )
      end
    end
  end
end
