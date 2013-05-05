class EnglishGate < Sinatra::Application
  get "/ubicacion" do
    @path = request.path_info
    @email = ENV['CONTACT_EMAIL']

    erb :ubicacion
  end
end
