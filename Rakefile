require './app'

# Rakefile
require 'sprockets/../rake/sprocketstask'
namespace :assets do

  task :configure do
    Rake::SprocketsTask.new do |t|
      t.environment = EnglishGate.sprockets
      t.output      = EnglishGate.assets_path
      t.assets      = %w(application.js application.css)
    end
  end

  task :precompile => :configure do
    Rake::Task['assets'].invoke
  end

end

