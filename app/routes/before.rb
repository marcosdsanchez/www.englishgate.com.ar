module EnglishGate
  class Application < Sinatra::Base
    before do
      @require_css = 'application'
      @require_js = 'application'
    end
  end
end
