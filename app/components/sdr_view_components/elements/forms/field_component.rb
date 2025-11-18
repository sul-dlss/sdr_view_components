# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Forms
      # Base component for all form fields.
      class FieldComponent < BaseComponent
        def initialize(form:, field_name:, required: false, hidden_label: false, label: nil, help_text: nil, # rubocop:disable Metrics/ParameterLists, Metrics/MethodLength, Metrics/AbcSize
                       disabled: false, hidden: false, data: {}, input_data: {}, placeholder: nil, width: nil,
                       label_classes: [], container_classes: [], input_classes: [], tooltip: nil, caption: nil,
                       error_classes: [], readonly: false, mark_required: false)
          @form = form
          @field_name = field_name
          @mark_required = mark_required
          @help_text = help_text
          @hidden = hidden
          @disabled = disabled
          @input_data = input_data
          @placeholder = placeholder
          @width = width
          @container_classes = container_classes # container_args
          @input_classes = input_classes # component_args
          @caption = caption
          @error_classes = error_classes
          @readonly = readonly

          # Argument hashes for passing through to sub-components
          @container_args = { class: @container_classes, data: }
          @component_args = { class: field_classes, required:, aria: field_aria, data:, form: form_id }
          @label_args = { form:, field_name:, label_text: label, hidden_label:, classes: label_classes,
                          tooltip: }
          @help_text_args = { id: help_text_id, help_text: }
          @invalid_args = { form:, field_name: }

          super()
        end

        attr_reader :form, :field_name, :hidden, :disabled, :placeholder, :width, :input_data, :caption, :readonly,
                    :container_args, :component_args, :label_args, :help_text_args, :invalid_args

        def help_text_id
          @help_text_id ||= form.field_id(field_name, 'help')
        end

        def field_aria
          error_aria.tap do |arias|
            # Set aria-required if we want to indicate required, but the field
            # does not actually have a required attribute
            #
            # This is used for collection/work forms where we do server-side
            # validation and don't want to block form submission on empty fields
            arias[:required] = true if @mark_required
          end
        end

        def error_aria
          InvalidFeedbackSupport.arias_for(field_name:, form:).tap do |arias|
            arias[:describedby] = merge_actions(arias[:describedby], help_text_id) if @help_text.present?
          end
        end

        def styles
          return if width.blank?

          "max-width: #{width}px;"
        end

        def container_classes
          merge_classes(@container_classes)
        end

        def field_classes
          merge_classes(@input_classes)
        end

        def error_classes
          merge_classes(@error_classes)
        end

        delegate :id, to: :form, prefix: true
      end
    end
  end
end
