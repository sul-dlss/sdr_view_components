# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Navigation
      # Component for rendering an alert.
      class NavItemComponent < BaseComponent
        def initialize(text:, path:)
          @text = text
          @path = path
          super()
        end

        attr_reader :text, :path
      end
    end
  end
end
