# frozen_string_literal: true

module SdrViewComponents
  module TabForm
    # Component for rendering tabbed navigation for a form.
    #
    # TabListComponent doesn't render a <form> tag itself -- the real <form> is rendered
    # separately (see HiddenFieldsFormComponent), and the panes' fields are associated with it
    # via the HTML `form` attribute (see TabbedFormBuilder) rather than DOM nesting, since panes
    # aren't necessarily inside the <form>.
    #
    # Panes can be any renderable object; if it responds to `active_tab_name=`, that's set for you
    # before rendering, so panes don't have to be passed `active_tab_name` at construction.
    class TabListComponent < BaseComponent
      renders_many :tabs, SdrViewComponents::TabForm::TabComponent
      renders_many :panes, ->(pane) { pane }

      # @param tabs_classes [String] grid classes for the tabs column
      # @param panes_classes [String] grid classes for the panes column
      def initialize(id:, active_tab_name:, classes: [], data: {}, tabs_classes: 'col-md-3', panes_classes: 'col-md-9') # rubocop:disable Metrics/ParameterLists
        @id = id
        @active_tab_name = active_tab_name
        @classes = classes
        @data = data
        @tabs_classes = tabs_classes
        @panes_classes = panes_classes
        super()
      end

      attr_reader :id, :active_tab_name, :tabs_classes, :panes_classes

      def classes
        # Provides tab-error, tab-form as the static default classes
        # merged with any additional classes passed in.
        merge_classes(%w[tab-error row tab-form gx-4 gy-4 mb-5], @classes)
      end

      # `change` events fired by fields anywhere in the panes bubble up to this
      # component's root element (fields are associated with the real form via the
      # `form` attribute, not DOM nesting, so actions can't live on the `<form>` tag itself).
      def data
        @data.merge(controller: 'sdr-tab-error')
      end

      def invalid_description_id
        "#{id}-invalid-description"
      end
    end
  end
end
