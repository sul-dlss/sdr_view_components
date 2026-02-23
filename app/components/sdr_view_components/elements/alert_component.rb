# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for rendering an alert.
    class AlertComponent < BaseComponent
      # Variants are :danger, :success, :note, :info, :warning, :input
      # input is not part of the component library
      def initialize(title: nil, variant: :info, dismissible: false, data: {}, classes: [], id: nil, role: 'alert') # rubocop:disable Metrics/ParameterLists
        raise ArgumentError, 'Invalid variant' unless %i[danger success note info warning input].include?(variant.to_sym)

        @title = title
        @variant = variant
        @dismissible = dismissible
        @data = data
        @classes = classes
        @id = id
        @role = role
        super()
      end

      attr_reader :title, :variant, :data, :id, :role

      def classes
        merge_classes(%w[alert d-flex shadow-sm align-items-center], variant_class, dismissible_class, @classes)
      end

      def variant_class
        "alert-#{variant}"
      end

      def dismissible_class
        'alert-dismissible' if dismissible?
      end

      def dismissible?
        @dismissible
      end

      def icon?
        helpers.respond_to?(:"#{variant}_icon")
      end

      def icon
        helpers.public_send(:"#{variant}_icon", role: 'img', aria: { label: "#{variant} alert icon" })
      end

      def render?
        title.present? || content.present?
      end
    end
  end
end
