# frozen_string_literal: true

module SdrViewComponents
  module Structure
    # Component for rendering page header sul logo.
    class HeaderSulLogoComponent < BaseComponent
      # param sul_logo [String, nil] Optional class for SUL logo image. (polychrome, stacked-lg, stacked-mobile)
      def initialize(sul_logo: nil)
        @sul_logo = sul_logo
        super()
      end

      def call
        link_to 'https://library.stanford.edu', class: logo_classes, aria: { label: 'Stanford University Libraries' } do
          tag.span(class: 'visually-hidden') { 'Stanford University Libraries' }
        end
      end

      private

      def logo_classes
        merge_classes('mb-0 navbar-brand navbar-logo', @sul_logo)
      end
    end
  end
end
