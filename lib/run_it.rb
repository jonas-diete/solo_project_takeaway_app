require "./takeaway_app.rb"
# require "./meal.rb"
# require "./menu.rb"
# require "./order.rb"

# menu = Menu.new
# pizza = Meal.new("Pizza Margherita", 8.50)
# menu.add(pizza)
# burger = Meal.new("Veggie Burger", 7.90)
# menu.add(burger)
# chips = Meal.new("Chips", 3.20)
# menu.add(chips)
# falafel = Meal.new("Falafel Wrap", 6.00)
# menu.add(falafel)
# samosa = Meal.new("Vegetable Samosa", 2.50)
# menu.add(samosa)

# order = Order.new    
app = TakeawayApp.new(Kernel)
app.run