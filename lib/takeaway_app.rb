class TakeawayApp
  def initialize(io, menu, order)
    @io = io
    @menu = menu
    @order = order
    @option = ""
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

  def run
    while true do
      display_selection_screen
      ask_for_selection

      case @option
      when "1"
        @io.puts "Our Menu:"
        menu_list = @menu.get_menu
        menu_list.each do |meal|
          @io.puts "#{meal.get_name} - £#{sprintf("%.2f", meal.get_price)}"
        end
        @io.puts ""
      when "2"
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
      when "3"
        if @order.get_order == {}
          puts "You haven't added anything to your order yet."
        else
          puts "Your order summary:"
          @order.get_order.each do |meal, quantity|
            print "#{quantity}x #{meal.get_name} - £#{sprintf("%.2f", meal.get_price)}"
            if quantity > 1
              puts " each"
            else
              print "\n"
            end
          end
          puts "Total: £#{sprintf("%.2f", @order.get_total)}"
          puts ""
        end

      #TODO: other options
      when "5"
        exit
      else
        @io.puts "Please enter a number from 1-5"
      end
    end
  end
end