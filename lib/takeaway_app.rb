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
  end

  def ask_for_selection
    @io.puts "Choose your option (1-5):"
    @option = @io.gets.chomp
  end

  def run
    while @option != "5" do
      display_selection_screen
      ask_for_selection

      case @option
      when "1"
        @io.puts ""
        @io.puts "Our Menu:"
        menu_list = @menu.get_menu
        menu_list.each do |meal|
          @io.puts "#{meal.get_name} - £#{sprintf("%.2f", meal.get_price)}"
        end
        @io.puts ""
      when "2"
        @io.puts ""
        @io.puts "Please enter the name of the meal you would like to order:"
        meal_choice = @io.gets.chomp
        # TODO select the correct instance of meal from the array in @menu, and pass this on to @order.add. Return a message if that meal doesn't exist.
        @io.puts "Please enter the quantity of this meal that you would like."
        quantity = @io.gets.chomp
      #TODO: other options
      when "5"
        exit
      else
        @io.puts "Please enter a number from 1-5"
      end
    end
  end
end