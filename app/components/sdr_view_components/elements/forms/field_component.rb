# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Forms
      # Base component for all form fields.
      class FieldComponent < BaseComponent
        renders_one :component

        def initialize(**args)
          @args = args
          super()
        end

        attr_reader :args

        def caption
          args.fetch(:caption, nil)
        end

        def component_args
          { class: input_classes, required:, aria: field_aria, data:, form: form_id }
        end

        def container_args
          { class: container_classes, data: }
        end

        def container_classes
          merge_classes(args.fetch(:container_classes, []))
        end

        def data
          args.fetch(:data, {})
        end

        def disabled
          args.fetch(:disabled, false)
        end

        def error_aria
          InvalidFeedbackSupport.arias_for(field_name:, form:).tap do |arias|
            arias[:describedby] = merge_actions(arias[:describedby], help_text_id) if help_text.present?
          end
        end

        def error_classes
          merge_classes(args.fetch(:error_classes, []))
        end

        def form
          args.fetch(:form)
        end

        def field_name
          args.fetch(:field_name)
        end

        def help_text_args
          { id: help_text_id, help_text: }
        end

        def hidden
          args.fetch(:hidden, false)
        end

        def hidden_label
          args.fetch(:hidden_label, false)
        end

        def help_text
          args.fetch(:help_text, nil)
        end

        def help_text_id
          form.field_id(field_name, 'help')
        end

        def input_classes
          args.fetch(:input_classes, [])
        end

        def input_data
          args.fetch(:input_data, {})
        end

        def invalid_args
          { form:, field_name: }
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

        def label
          args.fetch(:label, nil)
        end

        def label_args
          { form:, field_name:, label_text: label, hidden_label:, classes: label_classes,
            tooltip: }
        end

        def label_classes
          args.fetch(:label_classes, [])
        end

        def mark_required
          args.fetch(:mark_required, false)
        end

        def placeholder
          args.fetch(:placeholder, nil)
        end

        def readonly
          args.fetch(:readonly, false)
        end

        def required
          args.fetch(:required, false)
        end

        def styles
          return if width.blank?

          "max-width: #{width}px;"
        end

        def tooltip
          args.fetch(:tooltip, nil)
        end

        def width
          args.fetch(:width, nil)
        end

        delegate :id, to: :form, prefix: true
      end
    end
  end
end
