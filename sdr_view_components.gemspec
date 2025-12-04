require_relative 'lib/sdr_view_components/version'

Gem::Specification.new do |spec|
  spec.name        = 'sdr_view_components'
  spec.version     = SdrViewComponents::VERSION
  spec.authors     = ['Aaron Collier']
  spec.email       = ['aaron.collier@stanford.edu']
  spec.homepage    = 'https://github.com/sul-dlss/sdr_view_components'
  spec.summary     = 'Rails gem for providing SDR-specific ViewComponents.'
  spec.description = 'Rails gem for providing SDR-specific ViewComponents.'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/sul-dlss/sdr_view_components'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 3.4'

  spec.add_dependency 'rails', '~> 8.0'
  spec.add_dependency 'view_component'
  spec.add_dependency 'zeitwerk'
end
