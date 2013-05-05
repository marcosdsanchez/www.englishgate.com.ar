require './app'

map '/' do
  run EnglishGate
end

map EnglishGate.assets_prefix do
  run EnglishGate.sprockets
end
