# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "crouton"
  s.version = '0.1.1'
  s.description = "Context sensitive notifications for Rails."
  s.summary = "Context sensitive notifications for Rails, the name and idea originated in a blog article written by Cyril Mottier on Android notifications."
  s.licenses = ['MIT']

  s.authors = ["Máximo Mussini"]
  s.email = ["maximomussini@gmail.com"]
  s.homepage = %q{https://github.com/ElMassimo/crouton}

  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = ["README.md"]

  s.add_dependency 'railties'
  s.add_dependency 'sass-rails'
  s.add_dependency 'jquery-rails'

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'
end
