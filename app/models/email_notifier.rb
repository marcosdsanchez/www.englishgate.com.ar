require 'pony'

module EnglishGate
  class EmailNotifier < EnglishGate::Notifier
    attr_accessor :subject

    def send
      Pony.mail({
        :from => @from,
        :to => @to,
        :subject => @subject,
        :body => @message,
        :charset => 'utf-8',
        :via => :smtp,
          :via_options => {
          :address              => ENV['SMTP_ADDRESS'],
          :port                 => ENV['SMTP_PORT'],
          :enable_starttls_auto => true,
          :user_name            => ENV['SMTP_USERNAME'],
          :password             => ENV['SMTP_PASSWORD'],
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => 'localhost.localdomain' # the HELO domain provided by the client to the server
        }
      })
    end
  end
end