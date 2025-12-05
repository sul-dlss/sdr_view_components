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

      # param title [String] The main application title text (Required).
      # param subtitle [String, nil] An optional subtitle text.
      # param variant [Symbol] One of :light, :dark, :white - determines color scheme.
      # param background_color [String, nil] Optional RGB color value for background (i.e. '1, 104, 149').
      #                                      Used only when variant is :dark.
      # param rosette [Boolean] Whether to show the rosette logo.
      # param sul_logo [String, nil] Optional URL for SUL logo image. (polychrome, stacked-lg, stacked-mobile)
      def initialize(title:, subtitle: nil, variant: :light, background_color: nil, rosette: true, sul_logo: nil) # rubocop:disable Metrics/ParameterLists
        @title = title
        @subtitle = subtitle
        @variant = variant
        @background_color = background_color
        @rosette = rosette
        @sul_logo = sul_logo
        super()
      end

      attr_reader :background_color, :rosette, :subtitle, :sul_logo, :title, :variant

      def masthead_classes
        merge_classes('masthead', VARIANT_MASTHEAD_CLASS[variant])
      end

      def navbar_classes
        merge_classes('navbar navbar-expand-md', VARIANT_NAVBAR_CLASS[variant])
      end

      def style_override_component
        return SdrViewComponents::Structure::StyleOverrideLightComponent.new unless variant == :dark

        SdrViewComponents::Structure::StyleOverrideDarkComponent.new(background_color:)
      end
    end
  end
end
