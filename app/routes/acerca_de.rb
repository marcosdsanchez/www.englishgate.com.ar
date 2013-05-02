# encoding: utf-8
class EnglishGate < Sinatra::Application
  ["/", "/acerca-de"].each do |route|
    get route do
      @path = request.path_info
      erb :acerca_de
    end
  end
end
