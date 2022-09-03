require "menu"

describe Menu do
  it "adds a meal to a list, then returns the list" do
    meal1 = double(:meal)
    menu = Menu.new
    menu.add(meal1)
    expect(menu.get_menu).to eq [meal1]
  end

  it "adds a few meals to a list, then returns the list" do
    meal1 = double(:meal)
    meal2 = double(:meal)
    meal3 = double(:meal)
    menu = Menu.new
    menu.add(meal1)
    menu.add(meal2)
    menu.add(meal3)
    expect(menu.get_menu).to eq [meal1, meal2, meal3]
  end
end