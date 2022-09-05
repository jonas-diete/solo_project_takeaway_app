require "order_summary_printer"

describe OrderSummaryPrinter do
  it "prints the order nicely formatted" do
    meal1 = double(:meal, get_name: "Veggie Burger", get_price: 7.90)
    meal2 = double(:meal, get_name: "Vegetable Samosa", get_price: 2.50)
    order = double(:order, get_order: {meal1 => 1, meal2 => 3}, get_total: 15.40)
    io = double(:io)

    expect(io).to receive(:puts).with("Your order summary:")
    expect(io).to receive(:print).with("1x Veggie Burger - £7.90")
    expect(io).to receive(:print).with("\n")
    expect(io).to receive(:print).with("3x Vegetable Samosa - £2.50")
    expect(io).to receive(:puts).with(" each")
    expect(io).to receive(:puts).with("Total: £15.40")
    expect(io).to receive(:puts).with("")

    order_summary_printer = OrderSummaryPrinter.new(io)
    order_summary_printer.print_summary(order)
  end

  it "returns a message if nothing has been ordered yet" do
    order = double(:order, get_order: {})
    io = double(:io)
    expect(io).to receive(:puts).with("You haven't added anything to your order yet.")
    order_summary_printer = OrderSummaryPrinter.new(io)
    order_summary_printer.print_summary(order)
  end
end