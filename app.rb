require 'sinatra/base'

module EnglishGate
  class Application < Sinatra::Base
    set :root, File.dirname(__FILE__)
  end
end
require_relative 'app/config/views'
require_relative 'app/config/sprockets'

require_relative 'app/models/init'
require_relative 'app/helpers/init'
require_relative 'app/routes/init'
