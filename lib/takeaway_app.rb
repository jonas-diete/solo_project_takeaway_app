require "./menu.rb" # for loading menu from file
require "./meal.rb" # for loading menu from file
require "./order.rb"  # for loading menu from file
require "csv" # for loading from file
require "./text_message.rb"
require "date"

class TakeawayApp
  def initialize(io) # add menu and order here when not loading from file
    @io = io

    @order = Order.new
    @menu = Menu.new
    file_content = CSV.read("./menu.csv")
    file_content.each do |line|
      meal = Meal.new(line[0], line[1].to_f)
      @menu.add(meal)
    end
    
    # required when not loading menu from file:
    # @menu = menu
    # @order = order
  end

  def display_selection_screen
    @io.puts "1. View Menu"
    @io.puts "2. Add a meal to your order"
    @io.puts "3. View your order summary"
    @io.puts "4. Place Order"
    @io.puts "5. Quit"
    @io.puts ""
  end

  def ask_for_selection
    @io.puts "Choose your option (1-5):"
    @option = @io.gets.chomp
  end

  def print_menu
    @io.puts "Our Menu:"
    menu_list = @menu.get_menu
    menu_list.each do |meal|
      @io.puts "#{meal.get_name} - £#{sprintf("%.2f", meal.get_price)}"
    end
    @io.puts ""
  end

  def add_meal
    while true do
      @io.puts "Please enter the name of the meal you would like to order:"
      meal_choice = @io.gets.chomp
      @io.puts "Please enter the quantity of this meal that you would like."
      quantity = @io.gets.chomp.to_i
      meal_exists = false
      @menu.get_menu.each do |meal|
        if meal.get_name == meal_choice
          @order.add(meal, quantity)
          meal_exists = true
        end
      end
      if !meal_exists
        puts "This meal doesn't exist."
      else
        break
      end
    end
  end

  def view_order_summary
    if @order.get_order == {}
      @io.puts "You haven't added anything to your order yet."
    else
      @io.puts "Your order summary:"
      @order.get_order.each do |meal, quantity|
        print "#{quantity}x #{meal.get_name} - £#{sprintf("%.2f", meal.get_price)}"
        if quantity > 1
          puts " each"
        else
          print "\n"
        end
      end
      @io.puts "Total: £#{sprintf("%.2f", @order.get_total)}"
      @io.puts ""
    end
  end

  def place_order
    if @order.get_order == {}
      puts "You haven't added anything to your order yet."
    else
      @io.puts "Please enter your UK mobile phone number to receive a confirmation SMS:"
      phone_number = @io.gets.strip
      while !((phone_number[0, 2] == "07" || phone_number[0,4] == "+447" || phone_number[0,5] == "00447") && phone_number.length > 9)
        @io.puts "Please enter a valid UK mobile phone number."
        phone_number = @io.gets.strip
      end
      delivery_time = (Time.now + (60 * 30)).strftime("%H:%M") # adding 30min to the current time, then formatting it
      text_message = TextMessage.new("Thank you! Your order was placed and will be delivered before #{delivery_time}.", phone_number)
      text_message.send
    end
  end

  def run
    while true do
      display_selection_screen
      ask_for_selection
      case @option
      when "1"
        print_menu
      when "2"
        add_meal
      when "3"
        view_order_summary
      when "4"
        place_order
      when "5"
        exit
      else
        @io.puts "Please enter a number from 1-5"
      end
    end
  end
end