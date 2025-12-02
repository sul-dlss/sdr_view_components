# frozen_string_literal: true

module SdrViewComponents
  module Structure
    # Component for rendering page header.
    class HeaderComponent < BaseComponent
      def initialize(current_user_sunetid:, title:, subtitle: nil)
        @current_user_sunetid = current_user_sunetid
        @title = title
        @subtitle = subtitle
        super()
      end

      attr_reader :current_user_sunetid, :title, :subtitle
    end
  end
end
