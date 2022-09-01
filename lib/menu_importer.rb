require "./lib/meal.rb"
require "./lib/menu.rb"
require "csv"

class MenuImporter
  def import
    menu = Menu.new
    file_content = CSV.read("./lib/menu.csv")
    file_content.each do |line|
      meal = Meal.new(line[0], line[1].to_f)
      menu.add(meal)
    end
  return menu
  end
end