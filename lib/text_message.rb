require "twilio-ruby"

class TextMessage
  def initialize(message, number)
    @message = message
    @number = number
  end

  def send
    account_sid = 'xxxxxxx' # enter your Twilio account SID
    auth_token = 'xxxxxxx' # enter your Twilio auth token
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+xxxxxxxx' # enter your Twilio phone number

    # uncomment lines below to send the message:

    # client.messages.create(
    # from: from,
    # to: @number,
    # body: @message
    # )
  end
end