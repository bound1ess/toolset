task :install do
    sh "bundle install"
end

task :test do
    sh "rspec ./spec --color --format=documentation --require=spec_helper.rb"
    sh "./bin/update-coverage"
end

task :default => [:test]
