# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for rendering a form label.
    class LabelComponent < BaseComponent
      def initialize(form:, field_name:, text: nil, default_class: 'form-label', hidden: false, # rubocop:disable Metrics/ParameterLists, Metrics/MethodLength
                     classes: [], tooltip: nil, caption: nil, mark_required: false, id: nil)
        @form = form
        @id = id
        @text = text
        @field_name = field_name
        @hidden = hidden
        @default_class = default_class
        @classes = classes
        @tooltip = tooltip
        @caption = caption
        @mark_required = mark_required
        super()
      end

      attr_reader :field_name, :form, :tooltip, :caption, :mark_required, :id

      def text
        mark_label_required(label: @text.presence || field_name, mark_required:)
      end

      def classes
        merge_classes(@default_class, @classes, @hidden ? 'visually-hidden' : nil)
      end
    end
  end
end
