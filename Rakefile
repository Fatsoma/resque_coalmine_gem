#!/usr/bin/env rake
require "bundler/gem_tasks"

namespace :test do

  task :all do
    exec('bundle exec guard -c')
  end

end

task :default => 'test:all'