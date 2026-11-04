# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class CollapsibleSectionComponentPreview < ViewComponent::Preview
      def expanded
        render SdrViewComponents::Elements::CollapsibleSectionComponent.new(id: 'expanded-section',
                                                                            heading: 'Pages (2)',
                                                                            level: :h3,
                                                                            heading_classes: 'text-uppercase') do
          'Section content goes here.'
        end
      end

      def collapsed
        render SdrViewComponents::Elements::CollapsibleSectionComponent.new(id: 'collapsed-section',
                                                                            heading: 'Supplemental files (1)',
                                                                            level: :h3,
                                                                            expanded: false) do
          'Section content goes here.'
        end
      end
    end
  end
end
