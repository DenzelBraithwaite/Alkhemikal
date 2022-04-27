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
      @view.shop_menu_options(@player.current_hat, @player.current_robe, @player.gold, @enter_shop)
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
  def purchase_item(price, item, category)
    if insufficient_funds(price)
      @view.insufficient_funds
      continue_prompt
    else
      confirm = @view.confirm_purchase(item, price, @player.name)
      if confirm
        slow_dialogue("#{item.to_s.light_blue} #{'added to your inventory.'.light_black}", 0.02, false)
        puts ''
        slow_dialogue("Shopkeeper #{'>'.blue} Thanks#{','.blue} appreciate the business#{'!'.blue}", 0.008, false)
        @player.gold -= price
        select_category(category) << item.to_s
        continue_prompt
      elsif confirm == false
        clear
        reroute_category(category)
      else
        clear
        @view.invalid_option
        clear
        purchase_item(price, item, category)
      end
    end
  end

  def reroute_category(category)
    case category
    when 'hats' then buy_hat
    when 'robes' then buy_robe
    when 'ingredients' then buy_ingredient
    when 'potions' then buy_potion
    when 'advice' then buy_advice
    end
  end

  def select_category(category)
    case category
    when 'hats' then unlocked_to = @player.hats
    when 'robes' then unlocked_to = @player.robes
    when 'ingredients' then unlocked_to = @player.ingredients
    when 'potions' then unlocked_to = nil
    when 'advice'
      puts "advice here"
      sleep(2)
      unlocked_to = nil
    end
    return unlocked_to unless unlocked_to.nil?
  end

  # Displays hats for purchase, checks if player has enough gold, adds hat to inventory.
  def buy_hat
    @view.display_hats(@view.hats)
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
    case choice
    when 5 then purchase_item(@view.hats.values[0], @view.hats.keys[0], 'hats')
    when 80 then purchase_item(@view.hats.values[1], @view.hats.keys[1], 'hats')
    when 120 then purchase_item(@view.hats.values[2], @view.hats.keys[2], 'hats')
    when 150 then purchase_item(@view.hats.values[3], @view.hats.keys[3], 'hats')
    when 200 then purchase_item(@view.hats.values[4], @view.hats.keys[4], 'hats')
    # This will return user to previous menu, completing the case statement
    when 9 then nil
    else
      clear
      @view.invalid_option
      clear
      buy_hat
    end
  end

  # Displays robes for purchase, checks if player has enough gold, adds hat to inventory.
  def buy_robe
    @view.display_robes(@view.robes)
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
    case choice
    when 20 then purchase_item(@view.robes.values[0], @view.robes.keys[0], 'robes')
    when 99 then purchase_item(@view.robes.values[1], @view.robes.keys[1], 'robes')
    when 113 then purchase_item(@view.robes.values[2], @view.robes.keys[2], 'robes')
    when 166 then purchase_item(@view.robes.values[3], @view.robes.keys[3], 'robes')
    when 240 then purchase_item(@view.robes.values[4], @view.robes.keys[4], 'robes')
    # This will return user to previous menu, completing the case statement
  when 9 then nil
  else
    clear
    @view.invalid_option
    clear
    buy_robe
  end
  end
end
