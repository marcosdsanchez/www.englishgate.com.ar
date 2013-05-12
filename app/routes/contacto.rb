require 'sinatra/json'

module EnglishGate
  class Application < Sinatra::Base
    helpers Sinatra::JSON

    get '/contacto' do
      @path = request.path_info
      erb :contacto
    end

    post '/contacto' do
      contact_form = ContactFormValidator.new(params)
      if contact_form.valid?
        contact_email = compose_email
        contact_email.send
      end
      json contact_form.response
    end

    private

    def compose_email
      message = erb 'emails/contact_message'
      ContactEmailNotifier.new(params[:email], message)
    end
  end
end
