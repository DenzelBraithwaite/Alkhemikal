require_relative '../views/shop_view'

class ShopController < ParentController
  def initialize
    super(player)
    @view = ShopView.new
  end

  def run
    @running = true
    @enter_shop = true
    while @running
      @view.shop_menu_options(@player.gold, @enter_shop)
      print "#{@player.name}#{'> '.blue}"
      action = gets.chomp.to_i
      clear
      @view.title_art.blue.blink
      route_action(action)
      clear
    end
    @view.visited = true
  end

  # Routes player depending on their choice
  def route_action(action)
    case action
    when 1
      @enter_shop = false
      @item_category = 'hat'
      buy_hat
    when 2
      @enter_shop = false
      @item_category = 'robe'
      buy_robe
    when 3
      @enter_shop = false
      @item_category = 'ingredient'
      buy_ingredient
    when 4
      @enter_shop = false
      @item_category = 'potion'
      buy_potion
    when 5
      @enter_shop = false
      @item_category = 'piece of advice'
      buy_advice
    when 9
      @running = false
    else
      @view.invalid_option
      clear
    end
  end

  def insufficient_funds(price)
    (@player.gold - price).negative?
  end

  # Checks if player has enough gold, adds hat to inventory if they do, otherwise tell them they're broke.
  def purchase_item(price, hat)
    if insufficient_funds(price)
      @view.insufficient_funds
      continue_prompt
    else
      confirm = @view.confirm_purchase(hat, price, @player.name)
      if confirm
        slow_dialogue("#{hat.to_s.light_blue} #{'added to your inventory.'.light_black}", 0.02, false)
        puts ''
        slow_dialogue("Shopkeeper #{'>'.blue} Thanks#{','.blue} appreciate the business#{'!'.blue}", 0.008, false)
        @player.gold -= price
        @player.unlocked_hats << hat.to_s
        continue_prompt
      end
    end
  end

  # Displays hats for purchase, checks if player has enough gold, adds hat to inventory.
  def buy_hat
    @view.display_hats(@view.hats)
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
    case choice
    when 5 then purchase_item(@view.hats.values[0], @view.hats.keys[0])
    when 80 then purchase_item(@view.hats.values[1], @view.hats.keys[1])
    when 120 then purchase_item(@view.hats.values[2], @view.hats.keys[2])
    when 150 then purchase_item(@view.hats.values[3], @view.hats.keys[3])
    when 200 then purchase_item(@view.hats.values[4], @view.hats.keys[4])
    end
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
