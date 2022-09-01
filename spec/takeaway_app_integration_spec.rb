require "takeaway_app"
require "meal"
require "menu"
require "order"

describe TakeawayApp do
  it "prints the menu when asked to" do
    io = double(:io)
    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("1").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Our Menu:").ordered
    expect(io).to receive(:puts).with("Pizza Margherita - £8.50").ordered
    expect(io).to receive(:puts).with("Veggie Burger - £7.90").ordered
    expect(io).to receive(:puts).with("Chips - £3.20").ordered
    expect(io).to receive(:puts).with("Falafel Wrap - £6.00").ordered
    expect(io).to receive(:puts).with("Vegetable Samosa - £2.50").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("5").ordered
    expect(io).to receive(:puts).with("").ordered

    time = Time.new(2022, 9, 1, 15, 5, 0)
    takeaway_app = TakeawayApp.new(io, time)
    takeaway_app.run
  end

  it "meal_adder adds a meal, order_summary_printer displays order summary" do
    io = double(:io)
    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Please enter the name of the meal you would like to order:").ordered
    expect(io).to receive(:gets).and_return("Veggie Burger").ordered
    expect(io).to receive(:puts).with("Please enter the quantity of this meal that you would like.").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    
    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("3").ordered
    expect(io).to receive(:puts).with("").ordered
    
    expect(io).to receive(:puts).with("Your order summary:").ordered
    expect(io).to receive(:print).with("2x Veggie Burger - £7.90").ordered
    expect(io).to receive(:puts).with(" each").ordered
    expect(io).to receive(:puts).with("Total: £15.80").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("5").ordered
    expect(io).to receive(:puts).with("").ordered

    time = Time.new(2022, 9, 1, 15, 5, 0)
    takeaway_app = TakeawayApp.new(io, time)
    takeaway_app.run
  end

  it "meal_adder adds a meal, order_summary_printer displays order summary" do
    io = double(:io)
    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Please enter the name of the meal you would like to order:").ordered
    expect(io).to receive(:gets).and_return("Veggie Burger").ordered
    expect(io).to receive(:puts).with("Please enter the quantity of this meal that you would like.").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    
    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Please enter the name of the meal you would like to order:").ordered
    expect(io).to receive(:gets).and_return("Chips").ordered
    expect(io).to receive(:puts).with("Please enter the quantity of this meal that you would like.").ordered
    expect(io).to receive(:gets).and_return("1").ordered
    
    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("3").ordered
    expect(io).to receive(:puts).with("").ordered
    
    expect(io).to receive(:puts).with("Your order summary:").ordered
    expect(io).to receive(:print).with("2x Veggie Burger - £7.90").ordered
    expect(io).to receive(:puts).with(" each").ordered
    expect(io).to receive(:print).with("1x Chips - £3.20").ordered
    expect(io).to receive(:print).with("\n").ordered
    expect(io).to receive(:puts).with("Total: £19.00").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered
    
    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("5").ordered
    expect(io).to receive(:puts).with("").ordered

    time = Time.new(2022, 9, 1, 15, 5, 0)
    takeaway_app = TakeawayApp.new(io, time)
    takeaway_app.run
  end

  it "meal_adder adds a meal, order_placer places order and displays SMS" do
    io = double(:io)
    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Please enter the name of the meal you would like to order:").ordered
    expect(io).to receive(:gets).and_return("Veggie Burger").ordered
    expect(io).to receive(:puts).with("Please enter the quantity of this meal that you would like.").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    
    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("4").ordered
    expect(io).to receive(:puts).with("").ordered
    
    expect(io).to receive(:puts).with("Please enter your UK mobile phone number to receive a confirmation SMS:")
    expect(io).to receive(:gets).and_return("07544556677")
    expect(io).to receive(:puts).with("Thank you! Your order was placed and will be delivered before 15:35.")

    expect(io).to receive(:puts).with("1. View Menu").ordered
    expect(io).to receive(:puts).with("2. Add a meal to your order").ordered
    expect(io).to receive(:puts).with("3. View your order summary").ordered
    expect(io).to receive(:puts).with("4. Place Order").ordered
    expect(io).to receive(:puts).with("5. Quit").ordered
    expect(io).to receive(:puts).with("").ordered

    expect(io).to receive(:puts).with("Choose your option (1-5):").ordered
    expect(io).to receive(:gets).and_return("5").ordered
    expect(io).to receive(:puts).with("").ordered

    time = Time.new(2022, 9, 1, 15, 5, 0)
    takeaway_app = TakeawayApp.new(io, time)
    takeaway_app.run
  end
  
end