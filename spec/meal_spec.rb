require "meal"

describe Meal do
  it "returns the price" do
    pizza = Meal.new("Pizza Margherita", 8.50)
    expect(pizza.get_price).to eq 8.50
  end

  it "returns the name" do
    pizza = Meal.new("Pizza Margherita", 8.50)
    expect(pizza.get_name).to eq "Pizza Margherita"
  end
end