$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "static_pages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "static_pages"
  s.version     = StaticPages::VERSION
  s.authors     = ["Tortus Tek Inc."]
  s.email       = ["support@tortus.com"]
  s.homepage    = "https://github.com/tortus/static_pages"
  s.summary     = "Simple static pages engine for Rails 3.2"
  # s.description = "Simple static pages engine for Rails 3.2"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
