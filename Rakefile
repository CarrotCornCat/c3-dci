# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'jeweler'
require 'rspec/core'
require 'rspec/core/rake_task'

require "c3-dci"

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "c3-dci"
  gem.homepage = "http://github.com/CarrotCornCat/c3-dci"
  gem.version = C3DCI.version
  gem.license = "MIT"
  gem.summary = %Q{A tiny DCI helper library}
  gem.description = %Q{TA tiny helper library for the DCI pattern}
  gem.email = "chris@dinarrr.com"
  gem.authors = ["Christoph Grabo"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Starts IRB with gem loaded"
task :irb do
  sh "irb -I lib -r c3-dci"
end

desc "Starts PRY with gem loaded"
task :pry do
  sh "pry -I lib -r c3-dci --no-pager"
end

task :default => :spec
