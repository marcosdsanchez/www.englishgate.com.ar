require 'sinatra/partial'

class EnglishGate < Sinatra::Application
  register Sinatra::Partial

  set :partial_template_engine, :erb
  set :views, root + '/app/views'
  set :public_folder, Proc.new { File.join(root, "public") }
  set :static, true
  enable :partial_underscores
end