require './app'

map '/' do
  run EnglishGate::Application
end

map Sprockets::Helpers.prefix do
  run EnglishGate::Application.sprockets
end
