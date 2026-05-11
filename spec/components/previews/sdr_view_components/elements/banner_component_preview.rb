# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class BannerComponentPreview < ViewComponent::Preview
      # @!group Variants
      def default
        render SdrViewComponents::Elements::BannerComponent.new do |component|
          component.with_header { 'Welcome to the Banner Component' }
        end
      end

      def note
        render SdrViewComponents::Elements::BannerComponent.new(variant: :note) do |component|
          component.with_header { 'Note: Important Information' }
        end
      end

      def success
        render SdrViewComponents::Elements::BannerComponent.new(variant: :success) do |component|
          component.with_header { 'Success: Action Completed' }
        end
      end

      def warning
        render SdrViewComponents::Elements::BannerComponent.new(variant: :warning) do |component|
          component.with_header { 'Warning: Please Review' }
        end
      end

      def info
        render SdrViewComponents::Elements::BannerComponent.new(variant: :info) do |component|
          component.with_header { 'Information: For Your Reference' }
        end
      end

      def danger
        render SdrViewComponents::Elements::BannerComponent.new(variant: :danger) do |component|
          component.with_header { 'Danger: Critical Alert' }
        end
      end
      # @!endgroup

      def with_title
        render SdrViewComponents::Elements::BannerComponent.new(title: 'Subtitle or Additional Title') do |component|
          component.with_header { 'Main Header' }
        end
      end

      def with_header_and_body
        render SdrViewComponents::Elements::BannerComponent.new do |component|
          component.with_header { 'Banner Header' }
          component.with_body { 'This is the body content of the banner, providing additional context or details.' }
        end
      end
    end
  end
end
