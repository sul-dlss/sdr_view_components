# frozen_string_literal: true

module SdrViewComponents
  module Structure
    # Component for rendering page header title.
    class HeaderTitleComponent < BaseComponent
      # param title [String] Header title text - Required.
      def initialize(title:)
        @title = title
        super()
      end

      def call
        tag.div(class: 'h1 my-0') do
          link_to @title, '/'
        end
      end
    end
  end
end
