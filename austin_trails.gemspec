require_relative "lib/austin_trails/version"

Gem::Specification.new do |spec|
  spec.name          = "austin_trails"
  spec.version       = AustinTrails::VERSION
  spec.authors       = ["vincent"]
  spec.email         = ["vincentuong@yahoo.com"]

  spec.summary       = "This app will find a trail in Austin for hikers to explore."
  spec.description   = "The user will be able to obtain the address and key info for each trail in Austin."
  spec.homepage      = "https://www.timeout.com/austin/things-to-do/best-hikes-in-austin"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://www.timeout.com/austin/things-to-do/best-hikes-in-austin"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.timeout.com/austin/things-to-do/best-hikes-in-austin"
  spec.metadata["changelog_uri"] = "https://www.timeout.com/austin/things-to-do/best-hikes-in-austin"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri"
end