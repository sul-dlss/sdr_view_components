# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Navigation
      # Component for rendering an alert.
      class NavItemComponent < BaseComponent
        def initialize(text:, path:, data: {})
          @text = text
          @path = path
          @data = data
          super()
        end

        attr_reader :text, :path, :data
      end
    end
  end
end
