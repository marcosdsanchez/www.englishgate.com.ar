module EnglishGate
  class Notifier
    attr_accessor :from, :to, :message

    def initialize(from, to, message)
      @from, @to, @message    = from, to, message
    end
  end
end