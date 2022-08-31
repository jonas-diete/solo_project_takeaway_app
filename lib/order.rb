class Order
  def initialize
    @order_hash = {} 
  end

  def add(meal, quantity) 
    if @order_hash.has_key?(meal)
      @order_hash[meal] += quantity
    else
      @order_hash[meal] = quantity
    end
  end

  def get_total
    total = 0.00
    @order_hash.each do |meal, quantity|
      total += quantity * meal.get_price
    end
    return total
  end

  def get_order
    @order_hash
  end

  def get_phone_number
    # asks user for phone number
    # => returns number (a string)
  end

  def place_order
    # calls get_phone_number
    # creates a new object of class text message and sends that message to user
  end
end