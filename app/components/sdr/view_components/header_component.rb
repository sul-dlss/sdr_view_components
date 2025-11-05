# frozen_string_literal: true

module Sdr
  module ViewComponents
    # Component for rendering page header.
    class HeaderComponent < ViewComponent::Base
      def initialize(current_user_sunetid:, title:, subtitle:)
        @current_user_sunetid = current_user_sunetid
        @title = title
        @subtitle = subtitle
        super()
      end

      attr_reader :current_user_sunetid, :title, :subtitle
    end
  end
end
