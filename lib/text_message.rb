require "twilio-ruby"

class TextMessage
  def initialize(message, number)
    @message = message
    @number = number
  end

  def send
    account_sid = 'AC5ea63c8deaaf26d0be69413ed864429e'
    auth_token = '6808039b49212f9b9cc5f236947c6f98'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+12069849174' # Your Twilio number

    client.messages.create(
    from: from,
    to: @number,
    body: "Test message" # put in real message here
    )
  end
end