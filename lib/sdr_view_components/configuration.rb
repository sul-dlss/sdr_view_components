# frozen_string_literal: true

# SDR View Components module
module SdrViewComponents
  # Configuration class for the SDR View Components gem
  class Configuration
    attr_accessor :component_library_url

    def initialize
      # Default URL for the component library assets
      @component_library_url = 'https://cdn.jsdelivr.net/gh/sul-dlss/component-library@v2026-01-27'
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
