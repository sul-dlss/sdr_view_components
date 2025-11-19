# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Forms
      # Component for rendering a form label.
      class LabelComponent < BaseComponent
        def initialize(form:, field_name:, text: nil, default_class: 'form-label', hidden: false, # rubocop:disable Metrics/ParameterLists
                       classes: [], tooltip: nil, caption: nil)
          @form = form
          @text = text
          @field_name = field_name
          @hidden = hidden
          @default_class = default_class
          @classes = classes
          @tooltip = tooltip
          @caption = caption
          super()
        end

        attr_reader :field_name, :form, :tooltip, :caption

        def text
          return field_name if @text.blank?

          @text
        end

        def classes
          merge_classes(@default_class, @classes, @hidden ? 'visually-hidden' : nil)
        end
      end
    end
  end
end
