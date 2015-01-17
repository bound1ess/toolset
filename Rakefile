task :install do
    sh "bundle install"
end

task :test do
    sh "rspec ./spec --color --format=documentation --require=spec_helper.rb"
end

task :default => [:test]
