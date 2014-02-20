$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'redcloud/version'

Gem::Specification.new do |s|
  s.name = "redcloud"
  s.version = RedCloud::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0")
  s.authors = ["Joel VanderWerf"]
  s.date = Time.now.strftime "%Y-%m-%d"
  s.summary = "Simulation of data centers"
  s.description = "Simulation of data centers using dynamic networks of hybrid automata and continuous variables for request rates etc."
  s.email = "vjoel@users.sourceforge.net"
  s.extra_rdoc_files = ["README.md"]
  s.files = Dir[
    "Rakefile", "README.md",
    "lib/**/*.rb",
    "test/**/*.rb"
  ]
  s.homepage = "https://github.com/vjoel/redcloud"
  s.license = "BSD"
  s.rdoc_options = [
    "--quiet", "--line-numbers", "--inline-source",
    "--title", "RedCloud", "--main", "README.md"]
  s.require_paths = ["lib"]

  s.add_dependency('redshift')
  s.add_development_dependency("rake", "~> 0")
end
