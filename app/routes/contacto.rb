# encoding: utf-8
class EnglishGate < Sinatra::Application
  helpers Sinatra::JSON

  get "/contacto" do
    @path = request.path_info
    erb :contacto
  end

  post "/contacto" do
    response = {}
    response[:email]   = "Email es requerido." if params[:email].to_s.empty?
    response[:email]   = "Email no válido." unless EmailValidator.valid?(params[:email])
    response[:message] = "Mensaje es requerido." if params[:message].to_s.empty?
    response[:mki]     = 'Por favor intente nuevamente.' unless params[:mki].to_s.empty?

    if response.empty?
      response[:ok] = 'ok'
      #self.compose_email
    end

    json response
  end

  def compose_email
    contactEmail = ContactEmailNotifier.new
    contactEmail.message = self.message
    contactEmail.send
  end

  def message
    "
    Nombre: #{params[:name]}
    Teléfono: (#{params[:phone]})
    Email: (#{params[:email]})

    #{params[:message]}
    "
  end

end

