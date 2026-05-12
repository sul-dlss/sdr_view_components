# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class BreadcrumbNavComponentPreview < ViewComponent::Preview
      # @!group Breadcrumb Types
      def default_breadcrumbs
        render SdrViewComponents::Elements::BreadcrumbNavComponent.new do |component|
          component.with_breadcrumb(text: 'Home', link: '/')
          component.with_breadcrumb(text: 'Collections', link: '/collections')
          component.with_breadcrumb(text: 'Current Page', active: true)
        end
      end

      def title_breadcrumbs
        render SdrViewComponents::Elements::BreadcrumbNavComponent.new do |component|
          component.with_title_breadcrumb(text: 'Home', link: '/')
          component.with_title_breadcrumb(text: 'A Very Long Title That Will Be Truncated', link: '/titles')
          component.with_title_breadcrumb(text: 'Current Title Item', active: true)
        end
      end

      def collection_breadcrumbs
        render SdrViewComponents::Elements::BreadcrumbNavComponent.new do |component|
          component.with_collection_breadcrumb(text: 'Home', link: '/')
          component.with_collection_breadcrumb(text: 'Collection Name Truncated', link: '/collections')
          component.with_collection_breadcrumb(text: 'Item', active: true)
        end
      end
      # @!endgroup

      # @!group With Links and Active State
      def with_all_links
        render SdrViewComponents::Elements::BreadcrumbNavComponent.new do |component|
          component.with_breadcrumb(text: 'Home', link: '/')
          component.with_breadcrumb(text: 'Section', link: '/section')
          component.with_breadcrumb(text: 'Subsection', link: '/section/subsection')
          component.with_breadcrumb(text: 'Current', active: true)
        end
      end

      def mixed_active_items
        render SdrViewComponents::Elements::BreadcrumbNavComponent.new do |component|
          component.with_breadcrumb(text: 'Home', link: '/')
          component.with_breadcrumb(text: 'Active Section', active: true)
          component.with_breadcrumb(text: 'Another Item', link: '/other')
        end
      end
      # @!endgroup
    end
  end
end
