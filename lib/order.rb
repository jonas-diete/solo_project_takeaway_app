class Order
  def initialize
    order_hash = {} # to save meals and their quantities
  end

  def ask_for_meal
    # asks user for a meal and a quantity
    # calls add with those information
  end

  def add(meal, quantity) # meal is an instance of Meal, quantity is an integer
    # saves meal and quantity in the order_hash
  end

  def get_total
    # returns total price for the order
  end

  def print_receipt
    # prints the receipt of the order so far
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