# frozen_string_literal: true

module SdrViewComponents
  module Tables
    # Component for rendering files as a treegrid table, with a collapsible row for each folder in their paths.
    # Requires the sdr-treegrid Stimulus controller.
    class TreegridTableComponent < BaseTableComponent
      # Files must be provided in path order, so that each folder's files and subfolders follow its row.
      renders_many :files, lambda { |path_parts: [], **args|
        TreegridFileRowComponent.new(path_parts:, hidden: collapsed? && path_parts.any?, **args)
      }

      # @param collapsed [Boolean] whether folders are initially collapsed
      # @param remember_expanded [Boolean] whether folders the user expands or collapses stay so when the table
      #   is rendered again (e.g., when its turbo frame reloads); requires an id
      def initialize(collapsed: false, remember_expanded: false, classes: [], data: {}, **args)
        raise ArgumentError, 'remember_expanded requires an id' if remember_expanded && args[:id].blank?

        @collapsed = collapsed
        super(classes: merge_classes('table-treegrid', classes),
              role: 'treegrid',
              data: data.merge(controller: merge_classes('sdr-treegrid', data[:controller]),
                               action: merge_actions('keydown->sdr-treegrid#navigate', data[:action]),
                               sdr_treegrid_remember_expanded_value: remember_expanded),
              **args)
      end

      def collapsed?
        @collapsed
      end

      def rows?
        files?
      end

      # Folder rows are inserted before the first file in each folder.
      def rows
        @rows ||= [expand_collapse_row, *file_and_folder_rows].compact
      end

      private

      def file_and_folder_rows
        last_path_parts = []
        files.flat_map do |file|
          folder_rows = new_folder_path_parts(last_path_parts:, path_parts: file.path_parts).map do |folder_path_parts|
            folder_row(folder_path_parts)
          end
          last_path_parts = file.path_parts
          [*folder_rows, file]
        end
      end

      # @return [Array<Array<String>>] the path parts of each folder in path_parts that is not in last_path_parts
      def new_folder_path_parts(last_path_parts:, path_parts:)
        matching_count = path_parts.zip(last_path_parts).take_while { |part, last_part| part == last_part }.size
        (matching_count...path_parts.size).map { |index| path_parts[0..index] }
      end

      def folder_row(folder_path_parts)
        render TreegridFolderRowComponent.new(path_parts: folder_path_parts,
                                              expanded: !collapsed?,
                                              hidden: collapsed? && folder_path_parts.size > 1,
                                              empty_cells: column_count - 1)
      end

      def expand_collapse_row
        return if files.none? { |file| file.path_parts.any? }

        render TreegridExpandCollapseRowComponent.new(colspan: column_count)
      end

      def column_count
        [headers.size, 1].max
      end
    end
  end
end
