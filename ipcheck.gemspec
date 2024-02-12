# frozen_string_literal: true

require_relative 'lib/ipcheck/version'

Gem::Specification.new do |spec|
  spec.name                  = 'ipcheck'
  spec.version               = Ipcheck::VERSION
  spec.authors               = ['Ivan Zabrodin']
  spec.email                 = ['xvanx84@gmail.com']
  spec.summary               = 'Check IP geolocation'
  spec.description           = 'Check IP geolocation with https://ip-api.com'
  spec.homepage              = 'https://github.com/EvanBrightside/ipcheck'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata = {
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => 'https://github.com/EvanBrightside/ipcheck',
    'changelog_uri' => 'https://github.com/EvanBrightside/ipcheck'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
