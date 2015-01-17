task :install do
    sh "bundle install"
    sh "touch toolset-dev.gem"
end

task :test do
    sh "rspec ./spec --color --format=documentation --require=spec_helper.rb"
    sh "./bin/update-coverage"
end

task :"build-gem" do
    sh "rm toolset-*.gem"
    sh "gem build toolset.gemspec"
end

task :"install-gem" do
    sh "gem install --local toolset-`cat ./version`.gem"
end

task :default => [:test]
