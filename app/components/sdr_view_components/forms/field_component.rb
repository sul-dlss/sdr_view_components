# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Base component for all form fields.
    class FieldComponent < BaseComponent
      def initialize(**args)
        @args = args
        super()
      end

      attr_reader :args

      # Any component that inherits from FieldComponent must implement this method
      # or provide it's own template.
      def component
        raise NotImplementedError
      end

      ##########################################################################
      # Argument builders for the various sub-components of a form field.
      # These methods extract arguments from the main args hash
      # based on a prefix convention.

      # Returns a hash of arguments for the container element.
      # Prefix and argument with 'container_' in order for it to be passed to
      # the container div. (i.e. :container_class will be passed as :class to
      # the container div)
      def container_args
        args_for(args:, prefix: 'container_')
      end

      # Returns a hash of arguments for the error element.
      # Prefix and argument with 'error_' in order for it to be passed to
      # to the invalid feedback element.
      def error_args
        args_for(args:, prefix: 'error_')
      end

      # Returns a hash of arguments for the help text element.
      # Prefix and argument with 'help_' in order for it to be passed to
      # to the help text element.
      def help_text_args
        args_for(args:, prefix: 'help_').merge({ id: help_text_id })
      end

      # Returns a hash of arguments for the input element.
      # Prefix and argument with 'input_' in order for it to be passed to
      # the input element.
      def input_args
        args_for(args:, prefix: 'input_').merge({ aria: field_aria })
      end

      # Returns a hash of arguments for the label element.
      # Prefix and argument with 'label_' in order for it to be passed to
      # the label element.
      def label_args
        args_for(args:, prefix: 'label_')
      end
      ##########################################################################

      def field_name
        @field_name ||= args.delete(:field_name)
      end

      def form
        @form ||= args.delete(:form)
      end

      private

      def error_aria
        InvalidFeedbackSupport.arias_for(field_name:, form:).tap do |arias|
          arias[:describedby] = merge_actions(arias[:describedby], help_text_id) if help_text_args[:text].present?
        end
      end

      def field_aria
        error_aria.tap do |arias|
          # Set aria-required if we want to indicate required, but the field
          # does not actually have a required attribute
          #
          # This is used for collection/work forms where we do server-side
          # validation and don't want to block form submission on empty fields
          arias[:required] = true if @args[:mark_required]
        end
      end

      def help_text_id
        @help_text_id ||= form.field_id(field_name, 'help')
      end
    end
  end
end
