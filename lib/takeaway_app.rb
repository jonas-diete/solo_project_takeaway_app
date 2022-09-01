require "./lib/order.rb" 
require "./lib/text_message.rb"
require "./lib/menu_importer.rb"
require "./lib/menu_printer.rb"
require "./lib/meal_adder.rb"
require "./lib/selection_screen_printer.rb"
require "./lib/order_summary_printer.rb"
require "./lib/order_placer.rb"

class TakeawayApp
  def initialize(io, time)
    @io = io
    @time = time

    menu_importer = MenuImporter.new
    @menu = menu_importer.import
    @order = Order.new
    @menu_printer = MenuPrinter.new(@io)
    @selection_screen_printer = SelectionScreenPrinter.new(@io)
    @meal_adder = MealAdder.new(@io)
    @order_summary_printer = OrderSummaryPrinter.new(@io)
    @order_placer = OrderPlacer.new(@io)
  end

  def ask_for_selection
    @io.puts "Choose your option (1-5):"
    @option = @io.gets.chomp
    @io.puts ""
  end

  def run
    while true do
      @selection_screen_printer.print_screen
      ask_for_selection
      case @option
      when "1"
        @menu_printer.print_menu(@menu)
      when "2"
        @meal_adder.add_meal(@menu, @order)
      when "3"
        @order_summary_printer.print_summary(@order)
      when "4"
        @order_placer.place_order(@order, @time)
      when "5"
        return
      else
        @io.puts "Please enter a number from 1-5"
      end
    end
  end
end