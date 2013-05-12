module EnglishGate
  class Application < Sinatra::Base
    helpers do
      include Sprockets::Helpers
    end
  end
end