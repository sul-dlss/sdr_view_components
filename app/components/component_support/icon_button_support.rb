# frozen_string_literal: true

module ComponentSupport
  # Renders the icon of an icon button, whose accessible name is its visually hidden label.
  module IconButtonSupport
    def before_render
      raise SdrViewComponents::Error::UnknownComponentIcon, "Unknown icon type: #{@icon}" unless button_icon?
    end

    # A nil icon is for a button whose classes draw its own icon (e.g., btn-close).
    def button_icon
      return if @icon.nil?

      helpers.public_send(:"#{@icon}_icon", classes: @icon_classes, aria: { hidden: true })
    end

    private

    def button_icon?
      @icon.nil? || helpers.respond_to?(:"#{@icon}_icon")
    end
  end
end
