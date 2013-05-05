class EnglishGate < Sinatra::Application
  get "/cursos" do
    erb :cursos
  end
end
