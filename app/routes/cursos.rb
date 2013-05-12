module EnglishGate
  class Application < Sinatra::Base
    get '/cursos' do
      erb :cursos
    end
  end
end