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
    takeaway_app = TakeawayApp.new(io)
    takeaway_app.run
  end

  it "ask_for_meal method adds a meal, print_receipt displays order summary" do

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

    takeaway_app = TakeawayApp.new(io)
    takeaway_app.run

  end
end