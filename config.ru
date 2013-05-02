# encoding: utf-8
require './app'

Encoding.default_external = 'utf-8'

map '/' do
  run EnglishGate
end

map EnglishGate.assets_prefix do
  run EnglishGate.sprockets
end
