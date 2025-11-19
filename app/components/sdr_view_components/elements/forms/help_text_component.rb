# frozen_string_literal: true

# Component for rendering help text for form fields.
module SdrViewComponents
  module Elements
    module Forms
      # Component for rendering help text for form fields.
      class HelpTextComponent < BaseComponent
        # this component can take plain text via 'help_text' or a block (which can contain html)
        # it will render the help_text if provided, else it will render the block content
        def initialize(id:, text: nil)
          @text = text
          @id = id
          super()
        end

        attr_reader :text, :id

        def render?
          text.present? || content.present?
        end
      end
    end
  end
end
