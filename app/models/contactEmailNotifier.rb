class ContactEmailNotifier < EmailNotifier

  def initialize
    self.from    = ENV['CONTACT_EMAIL']
    self.to      = ENV['CONTACT_EMAIL']
    self.subject = "Mensaje enviado desde la página web"
  end

end

