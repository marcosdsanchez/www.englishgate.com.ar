module EnglishGate
  class Application < Sinatra::Base
    configure :production do
      require 'newrelic_rpm'
    end
  end
end
