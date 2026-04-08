# frozen_string_literal: true

require 'sdr_view_components/version'
require 'sdr_view_components/engine'
require 'sdr_view_components/error'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

# SdrViewComponents module
module SdrViewComponents
end
