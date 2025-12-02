# frozen_string_literal: true

module SulViewComponents
  module Structure
    class FooterComponentPreview < ViewComponent::Preview
      def default
        render SdrViewComponents::Structure::FooterComponent.new
      end
    end
  end
end
