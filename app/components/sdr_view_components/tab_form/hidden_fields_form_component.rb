# frozen_string_literal: true

module SdrViewComponents
  module TabForm
    # Renders the one real <form> tag backing a TabListComponent-based tabbed form.
    # Contains only hidden fields -- the tabbed form's visible fields associate with this
    # form via the `form` HTML attribute (see TabbedFormBuilder), not DOM nesting.
    #
    # `url:` is optional and only needed when the model can't derive its own submission url
    # (e.g. it has no resourceful routes).
    class HiddenFieldsFormComponent < BaseComponent
      def initialize(model:, id:, hidden_fields: [], url: nil, html_options: {})
        @model = model
        @id = id
        @hidden_fields = hidden_fields
        @url = url
        @html_options = html_options
        super()
      end

      attr_reader :model, :id, :hidden_fields, :url, :html_options
    end
  end
end
