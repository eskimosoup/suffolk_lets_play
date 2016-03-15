require 'rubygems'
require 'yaml'
YAML::ENGINE.yamler = 'syck' if RUBY_VERSION.to_i < 2

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
