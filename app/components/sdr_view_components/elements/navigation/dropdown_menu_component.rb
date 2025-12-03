# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Navigation
      # Component for rendering an alert.
      class DropdownMenuComponent < BaseComponent
        renders_many :links

        def initialize(text:)
          @text = text
          super()
        end

        attr_reader :text
      end
    end
  end
end
