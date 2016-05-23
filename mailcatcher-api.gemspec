$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'mailcatcher/api/version'

Gem::Specification.new do |s|
  s.name        = 'mailcatcher-api'
  s.summary     = 'MailCatcher REST API SDK'
  s.description = s.summary
  s.email       = ['avakarev@gmail.com']
  s.authors     = ['Andrii Vakarev']
  s.homepage    = 'https://github.com/avakarev/mailcatcher-api'
  s.licenses    = ['MIT']


  s.version = MailCatcher::API::VERSION
  s.platform = Gem::Platform::RUBY
  s.files = Dir.glob('{lib}/**/*')
  s.require_paths = ['lib']
  s.required_rubygems_version = '>= 1.3.5'

  s.add_dependency 'multi_json', '~> 1.10'
  s.add_dependency 'faraday', '~> 0.9'
  s.add_dependency 'mail', '~> 2.6'
  s.add_development_dependency 'rspec-core', '~> 3.0'
  s.add_development_dependency 'minitest', '~> 5.4'
  s.add_development_dependency 'minitest-reporters', '~> 1.0'
  s.add_development_dependency 'rspec-expectations', '~> 3.0'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'webmock', '~> 1.18'
end
