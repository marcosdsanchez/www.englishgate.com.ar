require './app'

map '/' do
  run EnglishGate::Application
end

map EnglishGate::Application.assets_prefix do
  run EnglishGate::Application.sprockets
end
