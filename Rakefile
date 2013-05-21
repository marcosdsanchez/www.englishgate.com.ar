require './app'

# Rakefile
require 'sprockets/../rake/sprocketstask'
namespace :assets do

  task :configure do
    Rake::SprocketsTask.new do |t|
      t.environment = EnglishGate::Application.sprockets
      t.output      = File.dirname(Sprockets::Helpers.manifest.path)
      t.assets      = EnglishGate::Application.assets_to_compile
    end
  end

  task :precompile => :configure do
    Rake::Task['assets'].invoke
  end

end

