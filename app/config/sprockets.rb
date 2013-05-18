require 'sprockets'
require 'sinatra/sprockets-helpers'
module EnglishGate
  class Application < Sinatra::Base
    set :sprockets, Sprockets::Environment.new(root)
    set :assets_prefix, '/assets'
    set :digest_assets, true
    set(:assets_path)   { File.join public_folder, assets_prefix }
    set :assets_to_compile, %w{application.js application.css sections/contacto/application.js}

    configure do
      sprockets.append_path File.join(root, 'app', 'assets', 'stylesheets')
      sprockets.append_path File.join(root, 'app', 'assets', 'javascripts')
      sprockets.append_path File.join(root, 'components')

      Sprockets::Helpers.configure do |config|
        config.environment = sprockets
        config.manifest    = Sprockets::Manifest.new(sprockets, assets_path)
        config.prefix      = assets_prefix
        config.digest      = digest_assets
        config.public_path = public_folder
        if production?
          require 'uglifier'
          require 'yui/compressor'
          sprockets.js_compressor  = Uglifier.new(:output => {:comments => :none}, mangle: true)
          sprockets.css_compressor  = YUI::CssCompressor.new()
        end
      end
    end

  end
end