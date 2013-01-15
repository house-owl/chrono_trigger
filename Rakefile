# %w[rubygems rake rake/clean fileutils newgem rubigen rake/testtask].each { |f| require f }
# require File.dirname(__FILE__) + '/lib/chrono_trigger'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "chrono_trigger"
    s.authors = ["Jon Ciccone"]
    s.date = "2013-01-10"
    s.summary = "Rails cron jobs."
    s.description = "This gem allows you to write, deploy, and maintain cron jobs withing the rails framework."
    s.email = "darful@gmail.com"
    s.homepage = "https://github.com/darful/chrono_trigger"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install technicalpickles-jeweler -s http://gems.github.com"
end
