# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Tabs
      # Component for rendering a list of tabs in a tabbed interface.
      class TabListComponent < BaseComponent
        BREAKPOINTS = %i[sm md lg xl xxl].freeze

        renders_one :header # optional
        renders_many :tabs, Elements::Tabs::TabComponent
        renders_many :panes, Elements::Tabs::PaneComponent

        # @param classes [Array<String>, String] additional classes for the tab list.
        # @param content_classes [Array<String>, String] additional classes for the tab content container.
        # @param variant [Symbol] the visual style of the tabs (:default or :underline).
        # @param collapse_below [Symbol, nil] if given, the tabs are replaced with a `<select>`
        #   below this Bootstrap breakpoint (one of :sm, :md, :lg, :xl, :xxl). The tabs remain
        #   fully functional (the `<select>` drives the same Bootstrap tab JavaScript) -- this
        #   only changes how they're presented at narrow viewports. Leave nil (the default) to
        #   always render the tabs.
        # @param overflow_menu [Boolean] if true, tabs that don't fit on a single row are moved into a
        #   trailing "More" dropdown tab (by the `sdr-tab-overflow` controller).
        def initialize(classes: [], content_classes: [], variant: :default, collapse_below: nil, overflow_menu: false)
          @classes = classes
          @content_classes = content_classes
          @variant = variant
          @collapse_below = collapse_below
          @overflow_menu = overflow_menu

          raise ArgumentError, "Invalid variant: #{variant}" unless %i[underline default].include?(variant)
          if collapse_below && BREAKPOINTS.exclude?(collapse_below)
            raise ArgumentError, "Invalid collapse_below: #{collapse_below}"
          end

          super()
        end

        def collapse_below?
          @collapse_below.present?
        end

        def overflow_menu?
          @overflow_menu
        end

        def tab_list_data
          return {} unless overflow_menu?

          { controller: 'sdr-tab-overflow', action: 'shown.bs.tab->sdr-tab-overflow#syncMoreActive ' \
                                                    'turbo:before-morph-element->sdr-tab-overflow#preventMorph' }
        end

        def classes
          merge_classes('nav', @classes, variant_classes, collapse_below? ? ['d-none', "d-#{@collapse_below}-flex"] : nil)
        end

        def select_classes
          merge_classes('form-select', "d-#{@collapse_below}-none", @classes)
        end

        def content_classes
          merge_classes('tab-content', @content_classes)
        end

        private

        def variant_classes
          'nav-underline' if @variant == :underline
        end
      end
    end
  end
end
