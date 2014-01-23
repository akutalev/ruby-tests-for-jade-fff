# -*- coding: utf-8 -*-

require "rubygems"
require "rake"
require "rspec/core/rake_task"
require "rspec/core/version"
gem 'ci_reporter'
require 'ci/reporter/rake/rspec'

TEST_HOME = File.expand_path(File.dirname(__FILE__))

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
  t.verbose = false
  t.pattern = "#{TEST_HOME}/spec/**/*_spec.rb"
end

task :default => [:spec]