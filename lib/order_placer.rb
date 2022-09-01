require "date"

class OrderPlacer
  def initialize(io)
    @io = io
  end

  def ask_for_number
    @io.puts "Please enter your UK mobile phone number to receive a confirmation SMS:"
    phone_number = @io.gets.strip
    while !((phone_number[0, 2] == "07" || phone_number[0,4] == "+447" || phone_number[0,5] == "00447") && phone_number.length > 9)
      @io.puts "Please enter a valid UK mobile phone number."
      phone_number = @io.gets.strip
    end
    return phone_number
  end

  def place_order(order, time)
    if order.get_order == {}
      puts "You haven't added anything to your order yet."
    else
      phone_number = ask_for_number
      delivery_time = (time + (60 * 30)).strftime("%H:%M") # adding 30min to the current time, then formatting it
      message = "Thank you! Your order was placed and will be delivered before #{delivery_time}."
      text_message = TextMessage.new(message, phone_number)
      text_message.send
      @io.puts message
    end
  end
end