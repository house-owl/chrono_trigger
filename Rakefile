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
    s.summary = "TODO"
    s.email = "darful@gmail.com"
    s.homepage = ""
    s.description = "TODO"
    s.authors = ["Jon Ciccone"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
