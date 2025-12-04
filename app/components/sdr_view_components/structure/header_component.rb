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

      # param title [String] The main application title text.
      # Additional supported params:
      #   param subtitle [String, nil] An optional subtitle text.
      #   param variant [Symbol] One of :light, :dark, :white - determines color scheme.
      #   param background_color [String, nil] Optional RGB color value for background (i.e. '1, 104, 149').
      #                                        Used only when variant is :dark.
      #   param sul_logo [String, nil] Optional URL for SUL logo image. (polychrome, stacked-lg, stacked-mobile)
      def initialize(title:, **args)
        @title = title
        @subtitle = args[:subtitle]
        @variant = args.fetch(:variant, :light)
        @background_color = args[:background_color]
        @rosette = args.fetch(:rosette, true)
        @sul_logo = args[:sul_logo]
        super()
      end

      attr_reader :background_color, :rosette, :variant

      def masthead_classes
        merge_classes('masthead', VARIANT_MASTHEAD_CLASS[variant])
      end

      def navbar_classes
        merge_classes('navbar navbar-expand-md', VARIANT_NAVBAR_CLASS[variant])
      end

      def style_override
        return render SdrViewComponents::Structure::StyleOverrideLightComponent.new unless variant == :dark

        render SdrViewComponents::Structure::StyleOverrideDarkComponent.new(background_color:)
      end

      def subtitle
        return if @subtitle.blank?

        tag.span @subtitle, class: 'h4 d-block my-1'
      end

      def sul_logo
        logo_classes = merge_classes('mb-0 navbar-brand navbar-logo', @sul_logo)

        link_to 'Stanford University Libraries', 'https://library.stanford.edu', class: logo_classes
      end

      def title
        tag.div(class: 'h1 my-0') do
          link_to @title, '/'
        end
      end
    end
  end
end
