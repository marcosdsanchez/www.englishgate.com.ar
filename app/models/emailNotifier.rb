require 'pony'

class EmailNotifier < Notifier
  attr_accessor :subject

  def send
    Pony.mail({
      :from => self.from,
      :to => self.to,
      :subject => self.subject,
      :body => self.message,
      :via => :smtp,
        :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => ENV['SMTP_USERNAME'],
        :password             => ENV['SMTP_PASSWORD'],
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      }
    })
  end
end
