require "order"

describe Order do
  it "adds a meal and returns the order" do
    order = Order.new
    meal1 = double(:meal)
    order.add(meal1, 1)
    expect(order.get_order).to eq({meal1 => 1})
  end

  it "adds multiple meals and returns the order" do
    order = Order.new
    meal1 = double(:meal)
    meal2 = double(:meal)
    meal3 = double(:meal)
    order.add(meal1, 3)
    order.add(meal2, 1)
    order.add(meal3, 4)
    expect(order.get_order).to eq({meal1 => 3, meal2 => 1, meal3 => 4})
  end

  it "adds meals and gets the total" do
    order = Order.new
    meal1 = double(:meal, get_price: 4.30)
    meal2 = double(:meal, get_price: 2.50)
    meal3 = double(:meal, get_price: 11.00)
    order.add(meal1, 3)
    order.add(meal2, 1)
    order.add(meal3, 4)
    expect(order.get_total).to eq 59.40
  end
end