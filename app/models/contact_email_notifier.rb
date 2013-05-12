module EnglishGate
  class ContactEmailNotifier < EnglishGate::EmailNotifier

    def initialize(to, message)
      super(to, ENV['CONTACT_EMAIL'], message)
      @subject = 'Mensaje enviado desde la página web'
    end

  end
end

