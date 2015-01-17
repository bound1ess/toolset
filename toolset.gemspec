Gem::Specification.new do |spec|
    spec.name = "toolset"
    spec.version = File.read(File.dirname(__FILE__) + "/version")
    spec.date = Time.new.strftime("%Y-%m-%d")
    spec.license = "MIT"
    spec.summary = "Experimental project"
    spec.description = "Build a list of third-party software used in your project"
    spec.authors = ["bound1ess"]
    spec.email = "bound1ess.dev@gmail.com"
    spec.homepage = "https://github.com/bound1ess/toolset"

    spec.required_ruby_version = ">= 2.0.0"
    spec.executables = ["toolset"]

    spec.add_dependency("json")
    spec.add_dependency("thor")
    spec.add_dependency("rake")

    spec.add_development_dependency("rspec")
    spec.add_development_dependency("simplecov")
    spec.add_development_dependency("simplecov-json")

    spec.files = Dir["lib/**/*.rb"] + Dir["sample-projects/**/*"] + Dir["bin/*"]
    spec.test_files = Dir["spec/**/*.rb"]
end
