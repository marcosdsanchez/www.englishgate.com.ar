
require_relative 'sprockets'
require_relative 'validator/emailValidator'

class EnglishGate < Sinatra::Application

  helpers do
    def same_path?(current_path, link_path)
      return current_path == link_path
    end

    def email_to_js_string(email)
      parts = email.split('@')
      "'#{parts[0]}' + '@' +'#{parts[1]}'"
    end

  end

end

