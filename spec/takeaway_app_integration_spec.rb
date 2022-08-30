require "takeaway_app"
require "meal"
require "menu"
require "order"

describe TakeawayApp do
  it "prints the menu when asked to" do
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
    order = Order.new
    io = double(:io)
    expect(io).to receive(:puts).with("1. View Menu")
    expect(io).to receive(:puts).with("2. Add meal to your order")
    expect(io).to receive(:puts).with("3. View your order summary")
    expect(io).to receive(:puts).with("4. Place Order")
    expect(io).to receive(:puts).with("5. Quit")
    expect(io).to receive(:puts).with("Choose your option (1-5):")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:puts).with("Our Menu:")
    expect(io).to receive(:puts).with("Pizza Margherita - £8.50")
    expect(io).to receive(:puts).with("Veggie Burger - £7.90")
    expect(io).to receive(:puts).with("Chips - £3.20")
    expect(io).to receive(:puts).with("Falafel Wrap - £6.00")
    expect(io).to receive(:puts).with("Vegetable Samosa - £2.50")
    expect(io).to receive(:gets).and_return("5")
    app = TakeawayApp.new(io, menu, order)
    app.run
  end

  it "ask_for_meal method adds a meal, print_receipt displays order summary" do
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
  end
end