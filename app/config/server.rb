module EnglishGate
  class Application < Sinatra::Base
    configure do
      use Rack::Deflater
    end
  end
end