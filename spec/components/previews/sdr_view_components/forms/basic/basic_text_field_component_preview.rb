# frozen_string_literal: true

module SdrViewComponents
  module Forms
    module Basic
      class BasicTextFieldComponentPreview < ViewComponent::Preview
        def default; end

        # @!group Input Options
        def with_placeholder; end

        def disabled; end

        def required; end
        # @!endgroup
      end
    end
  end
end
