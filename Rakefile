require 'rubygems'

desc "Run all tests"
task :default => [:acceptance, "jasmine:ci", :spec]

desc "Run server"
task :serverup do
  system 'rackup -p 3000'
end

desc "Stop server"
task :serverdown do
  system 'pkill -9 -f rackup'
end

begin
  require 'cucumber'
  require 'cucumber/rake/task'
  
  desc "Run Acceptance Test"
  Cucumber::Rake::Task.new(:acceptance) do |t|
    t.cucumber_opts = "features"
  end
end

begin
  require 'rspec/core'
  require 'rspec/core/rake_task'
  desc "Run all specs in spec directory (excluding plugin specs)"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.fail_on_error = false
    t.rspec_opts = "--color --format documentation"
  end
end

begin
  desc "Run jasmine tests"
    require 'jasmine'  
    load 'jasmine/tasks/jasmine.rake'  
end

desc "travis"
task :travis do
  ["rspec spec", "rake jasmine:ci", "rake acceptance"].each do |cmd|
    puts "Starting to run #{cmd}..."
    system("export DISPLAY=:99.0 && bundle exec #{cmd}")
    raise "#{cmd} failed!" unless $?.exitstatus == 0
  end
end