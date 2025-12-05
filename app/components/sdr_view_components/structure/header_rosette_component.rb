# frozen_string_literal: true

module SdrViewComponents
  module Structure
    # Component for rendering page header rosette logo.
    class HeaderRosetteComponent < BaseComponent
      # Render the SUL Rosette logo in the header.
      def call
        tag.span class: 'rosette-logo me-1 align-self-start flex-shrink-0', aria: { hidden: 'true' }
      end
    end
  end
end
