# Phase 4 Solo Challenge Design Recipe

## 1. Describe the Problem

   _As a customer
    So that I can check if I want to order something
    I would like to see a list of dishes with prices.

    As a customer
    So that I can order the meal I want
    I would like to be able to select some number of several available dishes.

    As a customer
    So that I can verify that my order is correct
    I would like to see an itemised receipt with a grand total.
    => Show this as 'order summary', and after the order was placed successfully
    
    Implement with twilio ruby gem:

    As a customer
    So that I am reassured that my order will be delivered on time
    I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered._

## 2. Design the Class System

```
                                      ┌───────────────────────┐
                                      │ Meal                  │
                                      │                       │
                                      │ - initialize: with a  │
                                      │   name and price      │
┌───────────────────────────┐         │                       │
│ Menu                      │         │ - get_price           │
│                           │         │                       │
│ - add: a new instance of  ◄─────────┤ - get_name            │
│   meal, saved in a list   │         │                       │
│                           │         └───────────────────────┘
│                           │
│ - view: displays menu     │
│   to the user         ◄───┼───────┐     ┌────────────────────────────┐
│                           │       │     │ TakeawayApp                │
└───────────────────────────┘       │     │                            │
                                    │     │ - display_selection_screen │
                                    │     │                            │
┌──────────────────────────────┐    │     │ - ask_for_selection        │
│ Order                        │    │     │                            │
│                              │    │     │ - run: runs the previous   │
│ - ask_for_meal   ◄───────────┼────┼─----┼── two as a loop and calls  │
│                              │    │     │   other methods            │
│ - add: a meal and quantity   │    │     └────────────────────────────┘
│   to the order               │    │
│                              │    │
│ - get_total                  │    │
│                              │    │
│ - print_receipt  ◄───────────┼────┤
│                              │    │
│ - get_phone_number           │    │
│                              │    │
│ - place order  ◄─────────────┼────┘
│         │                    │
│         │                    │
└─────────┼────────────────────┘      ┌─────────────────────────┐
          │                           │ TextMessage             │
          └──────────────────────────►│                         │
                                      │ - initialize: creates   │
                                      │   the message           │
                                      │                         │
                                      │ - send                  │
                                      │                         │
                                      └─────────────────────────┘
```

```ruby
class TakeawayApp
  def display_selection_screen
    # prints out the options
    # 1. View Menu
    # 2. Add meal to your order
    # 3. View your order summary
    # 4. Place Order
  end

  def ask_for_selection
    # asks user for a selection
  end

  def run
  # calls display_selection_screen and ask_for_selection in a while loop
  # calls the appropriate methods depending on user input
  end

class Meal
  def initialize(name, price) # name is a string, price is a float (with 2 decimal places)
  end
  def get_price
    # returns the price (float)
  end
  def get_name
    # returns the name (string)
  end
end

class Menu
  def initialize
    menu_list = [] # to save the meals in
  end

  def add(meal) # meal is an instance of Meal
    # adds meal to list
  end

  def view
    # displays the menu with names and prices of the meals
  end
end

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

  class TextMessage
    def initialize(message, number) # both are strings
    end

    def send
      # sends the message to the given number
    end
  end
end
```

## 3. Examples as Integration Tests
_ Examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._
```ruby

# Test 1: view the menu
app = TakeawayApp.new
menu = Menu.new
pizza = Meal.new("Pizza Margherita", 8.50)
menu.add(pizza)
burger = Meal.new("Veggie Burger", 7.90)
menu.add(burger)
chips = Meal.new("Chips", 3.20)
menu.add(chips)
falafel = Meal.new("Falafel Wrap", 6.00)
menu.add(falafel)
samosa = Meal.new("Vegetable Samosa", 2.50)
menu.add(samosa)
app.run
# user selects 1
# => puts "Pizza Margherita - £8.50"
# => puts "Veggie Burger - £7.90"
# => puts "Chips - £3.20"
# => puts "Falafel Wrap - £6.00"
# => puts "Vegetable Samosa - £2.50"

# Tests 2-3: Add meals and print receipt
# Test 2:
app = TakeawayApp.new
menu = Menu.new
burger = Meal.new("Veggie Burger", 7.90)
menu.add(burger)
order = Order.new
app.run
# user selects 2
order.ask_for_meal
# user enters "Veggie Burger", then "2"
order.print_receipt 
# => puts "Your order summary:"
# => puts "2x Veggie Burger - £7.90 each"
# => puts "Total: £15.80"

# Test 3
app = TakeawayApp.new
menu = Menu.new
chips = Meal.new("Chips", 3.20)
menu.add(chips)
falafel = Meal.new("Falafel Wrap", 6.00)
menu.add(falafel)
samosa = Meal.new("Vegetable Samosa", 2.50)
menu.add(samosa)
order = Order.new
app.run
# user selects option 2
order.ask_for_meal
# user enters "Falafel Wrap", then "1"
# user selects option 2 again
order.ask_for_meal
# user enters "Chips", then "1"
# user selects option 2 again
order.ask_for_meal
# user enters "Vegetable Samosa", then "3"
# user selects option 3
order.print_receipt 
# => puts "Your order summary:"
# => puts "1x Falafel Wrap - £6.00"
# => puts "1x Chips - £3.20"
# => puts "3x Vegetable Samosa - £2.50 each"
# => puts "Total: £16.70"
```

## 4. Examples as Unit Tests

```ruby
# Unit tests for Meal
# test get_price method
pizza = Meal.new("Pizza Margherita", 8.50)
pizza.get_price # => 8.50

# test get_name method
pizza = Meal.new("Pizza Margherita", 8.50)
pizza.get_name # => "Pizza Margherita"
```
