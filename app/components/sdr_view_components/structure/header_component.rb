# frozen_string_literal: true

module SdrViewComponents
  module Structure
    # Component for rendering page header.
    class HeaderComponent < BaseComponent
      renders_many :primary_navigation_links
      renders_many :secondary_navigation_links

      VARIANT_MASTHEAD_CLASS = {
        light: 'bg-light',
        dark: 'bg-dark sky-dark',
        white: 'border-bottom'
      }.freeze

      VARIANT_NAVBAR_CLASS = {
        light: 'bg-light',
        dark: 'bg-dark sky-dark'
      }.freeze

      def initialize(title:, subtitle: nil, variant: :light)
        @title = title
        @subtitle = subtitle
        @variant = variant
        super()
      end

      attr_reader :title, :subtitle, :variant

      def masthead_classes
        merge_classes('masthead', VARIANT_MASTHEAD_CLASS[variant])
      end

      def navbar_classes
        merge_classes('navbar navbar-expand-md', VARIANT_NAVBAR_CLASS[variant])
      end

      def style_override
        return if variant == :dark

        render SdrViewComponents::Structure::StyleOverrideLightComponent.new
      end
    end
  end
end
