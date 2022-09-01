class MenuPrinter
  def initialize(io)
    @io = io
  end

  def print_menu(menu)
    @io.puts "Our Menu:"
    menu_list = menu.get_menu
    menu_list.each do |meal|
      @io.puts "#{meal.get_name} - £#{sprintf("%.2f", meal.get_price)}"
    end
    @io.puts ""
  end
end