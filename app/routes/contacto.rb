require 'json'

module EnglishGate
  class Application < Sinatra::Base

    get '/contacto' do
      @require_js = 'sections/contacto/application'
      @path = request.path_info
      erb :contacto
    end

    post '/contacto' do
      content_type :json
      contact_form = ContactFormValidator.new(params)
      if contact_form.valid?
        contact_email = compose_email
        contact_email.send
      end
      contact_form.response.to_json
    end

    private

    def compose_email
      message = erb :'emails/contact_message', :layout => false
      ContactEmailNotifier.new(params[:email], message)
    end
  end
end
