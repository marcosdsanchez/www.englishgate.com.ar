module EnglishGate
  class Application < Sinatra::Base
    %w{/ /acerca-de}.each do |route|
      get route do
        @path = request.path_info
        erb :acerca_de
      end
    end
  end
end
