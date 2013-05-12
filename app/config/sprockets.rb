require 'sprockets'
require 'sinatra/sprockets-helpers'
module EnglishGate
  class Application < Sinatra::Base
    set :sprockets, Sprockets::Environment.new(root)
    set :precompile,  [ /\w+\.(?!js|css).+/, /application.(css|js)$/ ]
    set :assets_prefix, '/assets'
    set :digest_assets, false
    set(:assets_path)   { File.join public_folder, assets_prefix }

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
      end
    end

  end
end