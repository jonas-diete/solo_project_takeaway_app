require "menu_printer"

describe MenuPrinter do
  it "prints the menu nicely formatted" do
    meal1 = double(:meal, get_name: "Pizza Margherita", get_price: 8.50)
    meal2 = double(:meal, get_name: "Veggie Burger", get_price: 7.90)
    meal3 = double(:meal, get_name: "Chips", get_price: 3.20)
    meal4 = double(:meal, get_name: "Falafel Wrap", get_price: 6.00)
    meal5 = double(:meal, get_name: "Vegetable Samosa", get_price: 2.50)
    menu = double(:menu, get_menu: [meal1, meal2, meal3, meal4, meal5])
    io = double(:io)
    expect(io).to receive(:puts).with("Our Menu:")
    expect(io).to receive(:puts).with("Pizza Margherita - £8.50")
    expect(io).to receive(:puts).with("Veggie Burger - £7.90")
    expect(io).to receive(:puts).with("Chips - £3.20")
    expect(io).to receive(:puts).with("Falafel Wrap - £6.00")
    expect(io).to receive(:puts).with("Vegetable Samosa - £2.50")
    expect(io).to receive(:puts).with("")
    menu_printer = MenuPrinter.new(io)
    menu_printer.print_menu(menu)
  end
end