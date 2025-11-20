require_relative 'lib/sdr_view_components/version'

Gem::Specification.new do |spec|
  spec.name        = 'sdr_view_components'
  spec.version     = SdrViewComponents::VERSION
  spec.authors     = ['Aaron Collier']
  spec.email       = ['aaron.collier@stanford.edu']
  spec.homepage    = 'https://github.com/sul-dlss-labs/sdr-view_components'
  spec.summary     = 'Rails gem for providing SDR-specific ViewComponents.'
  spec.description = 'Rails gem for providing SDR-specific ViewComponents.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/sul-dlss-labs/sdr-view_components'
  spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '~> 8.0'
  spec.add_dependency 'view_component'
  spec.add_dependency 'zeitwerk'
end
