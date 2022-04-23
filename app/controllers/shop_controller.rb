require_relative '../views/shop_view'

class ShopController < ParentController
  def initialize
    super(player)
    @view = ShopView.new
  end

  def run
    @running = true
    while @running
      @view.shop_menu_options(@player.gold)
      print "#{@player.name}#{'> '.blue}"
      action = gets.chomp.to_i
      clear
      @view.title_art.blue.blink
      route_action(action)
      clear
    end
  end

  # Routes player depending on their choice
  def route_action(action)
    case action
    when 1
      @item_category = 'hat'
      buy_hat
    when 2
      @item_category = 'robe'
      buy_robe
    when 3
      @item_category = 'ingredient'
      buy_ingredient
    when 4
      @item_category = 'potion'
      buy_potion
    when 5
      @item_category = 'piece of advice'
      buy_advice
    when 9 then @running = false
    else
      @view.invalid_option
      clear
    end
  end

  def buy_hat
    @view.display_hats(@view.hats)
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
  end

  def buy_robe
    @view.display_robes(@view.robes)
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
  end

  def buy_ingredient
    @view.display_ingredients(@view.ingredients)
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
  end

  def buy_potion
    @view.display_potions(@view.potions)
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
  end

  def buy_advice
    @view.display_advice(@view.advice)
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
  end


end
# @view.shop_menu_options(@item_category)
