module EnglishGate
  class Application < Sinatra::Base

    set :views, root + '/app/views'
    set :public_folder, Proc.new { File.join(root, "public") }
    set :static, true
  end
end