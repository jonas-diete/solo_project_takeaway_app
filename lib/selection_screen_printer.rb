class SelectionScreenPrinter
  def initialize(io)
    @io = io
  end
  def print_screen
    @io.puts "1. View Menu"
    @io.puts "2. Add a meal to your order"
    @io.puts "3. View your order summary"
    @io.puts "4. Place Order"
    @io.puts "5. Quit"
    @io.puts ""
  end
end