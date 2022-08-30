class Menu
  def initialize
    @menu_list = []
  end

  def add(meal)
    @menu_list << meal
  end

  def get_menu
    @menu_list
  end
end