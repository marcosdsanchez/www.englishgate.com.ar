# encoding: utf-8
require 'sinatra'
require 'sinatra/json'

class EnglishGate < Sinatra::Application
  set :root,           File.dirname(__FILE__)

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end
  configure do
    enable :sessions
  end
end


require_relative 'app/config/views'
require_relative 'app/config/sprockets'

require_relative 'app/models/init'
require_relative 'app/helpers/init'
require_relative 'app/routes/init'
