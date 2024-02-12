# frozen_string_literal: true

require_relative 'lib/ipcheck/version'

Gem::Specification.new do |spec|
  spec.name = 'ipcheck'
  spec.version = Ipcheck::VERSION
  spec.authors = ['Ivan Zabrodin']
  spec.email = ['xvanx84@gmail.com']
  spec.summary = 'Check IP geolocation'
  spec.description = 'Check IP geolocation with https://ip-api.com'
  spec.homepage = 'https://github.com/EvanBrightside/ipcheck'
  spec.required_ruby_version = '>= 3.2'

  spec.metadata = {
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => 'https://github.com/EvanBrightside/ipcheck',
    'changelog_uri' => 'https://github.com/EvanBrightside/ipcheck'
  }

  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
