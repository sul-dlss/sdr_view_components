# frozen_string_literal: true

module SdrViewComponents
  module Forms
    module Basic
      class BasicFileComponentPreview < ViewComponent::Preview
        def default; end

        # @!group File Input Options
        def with_accept
          # Demonstrates accept attribute to filter file types (e.g., images only)
        end

        def with_multiple
          # Demonstrates multiple attribute for uploading multiple files
        end

        def with_required
          # Demonstrates required attribute
        end
        # @!endgroup
      end
    end
  end
end
