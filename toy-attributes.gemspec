$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "toy-attributes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "toy-attributes"
  s.version     = ToyAttributes::VERSION
  s.authors     = ["Christian Mortaro"]
  s.email       = ["christian.mortaro@gmail.com"]
  s.homepage    = "https://github.com/Mortaro/Toy-Attributes"
  s.summary     = "Handles the attributes for Toy-Locomotive."
  s.description = "Allows to assign attributes directly inside ActiveRecord models without having to write migrations"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency "rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "sqlite3"
end
