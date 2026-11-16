# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class LinkToggleComponentPreview < ViewComponent::Preview
      def default
        render SdrViewComponents::Elements::LinkToggleComponent.new(
          label: 'Select view',
          links: [
            { label: 'List view', path: '/example/list', selected: true },
            { label: 'Grid view', path: '/example/grid', selected: false }
          ]
        )
      end
    end
  end
end
