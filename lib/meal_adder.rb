class MealAdder
  def initialize(io)
    @io = io
  end

  def add_meal(menu, order)
    while true do
      @io.puts "Please enter the name of the meal you would like to order:"
      meal_choice = @io.gets.chomp
      @io.puts "Please enter the quantity of this meal that you would like."
      quantity = @io.gets.chomp.to_i
      meal_exists = false
      menu.get_menu.each do |meal|
        if meal.get_name == meal_choice
          order.add(meal, quantity)
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
end