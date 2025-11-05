# frozen_string_literal: true

module SdrViewComponents
  # Component for rendering page header.
  class HeaderComponent < BaseComponent
    def initialize(current_user_sunetid:, title:, subtitle:)
      @current_user_sunetid = current_user_sunetid
      @title = title
      @subtitle = subtitle
      super()
    end

    attr_reader :current_user_sunetid, :title, :subtitle
  end
end
