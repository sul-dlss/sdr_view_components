# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Forms
      # Base component for all form fields.
      class FieldComponent < BaseComponent
        def initialize(**args)
          @args = args
          super()
        end

        attr_reader :args

        def call
          content_tag :div, container_args do
            safe_join(
              [
                component,
                render(SdrViewComponents::Elements::Forms::LabelComponent.new(form:, field_name:, **label_args)),
                render(SdrViewComponents::Elements::Forms::HelpTextComponent.new(**help_text_args)),
                render(SdrViewComponents::Elements::Forms::InvalidFeedbackComponent.new(form:, field_name:))
              ].compact
            )
          end
        end

        def input_args
          args_for(args:, prefix: 'input_').merge({ aria: field_aria, data: })
        end

        def container_args
          args_for(args:, prefix: 'container_')
        end

        def data
          @data ||= args.delete(:data) || {}
        end

        def error_aria
          InvalidFeedbackSupport.arias_for(field_name:, form:).tap do |arias|
            arias[:describedby] = merge_actions(arias[:describedby], help_text_id) if help_text_args[:text].present?
          end
        end

        def error_classes
          merge_classes(args.fetch(:error_classes, []))
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

        def field_name
          @field_name ||= args.delete(:field_name)
        end

        def form
          @form ||= args.delete(:form)
        end

        def help_text_args
          args_for(args:, prefix: 'help_').merge({
                                                   id: help_text_id
                                                 })
        end

        def help_text_id
          @help_text_id ||= form.field_id(field_name, 'help')
        end

        def label_args
          args_for(args:, prefix: 'label_')
        end

        delegate :id, to: :form, prefix: true
      end
    end
  end
end
