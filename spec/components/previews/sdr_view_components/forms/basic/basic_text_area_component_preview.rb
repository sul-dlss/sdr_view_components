# frozen_string_literal: true

module SdrViewComponents
  module Forms
    module Basic
      class BasicTextAreaComponentPreview < ViewComponent::Preview
        def default; end

        # @!group Text Area Options
        def with_rows; end

        def with_placeholder; end

        def with_required; end
        # @!endgroup
      end
    end
  end
end
