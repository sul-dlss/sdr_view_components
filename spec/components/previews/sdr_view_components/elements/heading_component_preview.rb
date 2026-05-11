# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class HeadingComponentPreview < ViewComponent::Preview
      # @!group Heading Levels
      def h1
        render SdrViewComponents::Elements::HeadingComponent.new(level: :h1, text: 'Page title')
      end

      def h2
        render SdrViewComponents::Elements::HeadingComponent.new(level: :h2, text: 'Section heading')
      end

      def h3
        render SdrViewComponents::Elements::HeadingComponent.new(level: :h3, text: 'Subsection heading')
      end

      def h4
        render SdrViewComponents::Elements::HeadingComponent.new(level: :h4, text: 'Supporting heading')
      end

      def h5
        render SdrViewComponents::Elements::HeadingComponent.new(level: :h5, text: 'Minor heading')
      end

      def h6
        render SdrViewComponents::Elements::HeadingComponent.new(level: :h6, text: 'Eyebrow heading')
      end
      # @!endgroup

      # @!group Variant Styling
      def h2_with_h1_styling
        render SdrViewComponents::Elements::HeadingComponent.new(level: :h2, text: 'Rendered as h2, styled like h1',
                                                                 variant: :h1)
      end

      def h3_with_h2_styling
        render SdrViewComponents::Elements::HeadingComponent.new(level: :h3, text: 'Rendered as h3, styled like h2',
                                                                 variant: :h2)
      end
      # @!endgroup

      def with_block_content
        render SdrViewComponents::Elements::HeadingComponent.new(level: :h2) do
          'Heading supplied by block content'
        end
      end
    end
  end
end
