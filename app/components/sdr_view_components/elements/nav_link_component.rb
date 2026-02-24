# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # A single link in the header nav, bootstrap-style
    class NavLinkComponent < ViewComponent::Base
      def initialize(title:, path:, **options)
        @title = title
        @path = path
        @options = options
        super()
      end

      attr_reader :title, :path, :options
    end
  end
end
