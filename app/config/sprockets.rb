require 'sprockets'
require 'sinatra/sprockets-helpers'
module EnglishGate
  class Application < Sinatra::Base
    set :sprockets, Sprockets::Environment.new(root)
    set :assets_to_compile, %w{application.js application.css sections/contacto/application.js}

    configure do
      paths = [
          File.join(root, 'app', 'assets', 'stylesheets'),
          File.join(root, 'app', 'assets', 'javascripts'),
          File.join(root, 'bower_components')
      ]
      paths.each do |path|
        sprockets.append_path path
      end

      Sprockets::Helpers.configure do |config|
        config.environment = sprockets
        config.prefix = '/assets'
        config.manifest = Sprockets::Manifest.new(sprockets, File.join(public_folder, config.prefix))
        config.digest = production?
        config.public_path = public_folder
        if production?
          require 'uglifier'
          sprockets.js_compressor = Uglifier.new(:output => {:comments => :none}, mangle: true)
        else
          config.debug = true
        end
      end
    end

  end
end
