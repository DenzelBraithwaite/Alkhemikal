require_relative '../views/shop_view'

class ShopController < ParentController
  def initialize
    super(player)
    @view = ShopView.new
    @purchased_waste_of_money = false
  end

  def run
    @running = true
    @enter_shop = true
    @player.purchased_bad_ingredients = false
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
      shop_for_hats
    when 2
      @enter_shop = false
      shop_for_robe
    when 3
      @enter_shop = false
      shop_for_ingredients
    when 4
      @enter_shop = false
      shop_for_potions
    when 5
      @enter_shop = false
      shop_for_advice
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

  def reroute_category(category)
    case category
    when 'hats' then shop_for_hats
    when 'robes' then shop_for_robe
    when 'ingredients' then shop_for_ingredients
    when 'potions' then shop_for_potions
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

  # Checks if player has enough gold, adds hat/robe to inventory if they do, otherwise tell them they're broke.
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

  # Displays hats for purchase, checks if player has enough gold, adds hat to inventory.
  def shop_for_hats
    @view.display_hats
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
      shop_for_hats
    end
  end

  # Displays robes for purchase, checks if player has enough gold, adds robe to inventory.
  def shop_for_robe
    @view.display_robes
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
      shop_for_robe
    end
  end

  # Displays potions for purchase, checks if player has enough gold, adds potion to inventory.
  def shop_for_potions
    good_potion_price = 999
    @view.display_potions
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
    case choice
    when 508 then purchase_potion(@view.potions.values[0], @view.potions.keys[0])
    when 699 then purchase_potion(@view.potions.values[1], @view.potions.keys[1])
    when 715 then purchase_potion(@view.potions.values[2], @view.potions.keys[2])
    when 888 then purchase_potion(@view.potions.values[3], @view.potions.keys[3])
    when 999 then purchase_potion(@view.potions.values[4], @view.potions.keys[4])
    # This will return user to previous menu, completing the case statement
    when 9 then nil
    else
      clear
      @view.invalid_option
      clear
      shop_for_potions
    end
  end

  # Checks if player has enough gold, adds potion to potions if it's valuable.
  def purchase_potion(price, item)
    if insufficient_funds(price)
      @view.insufficient_funds
      continue_prompt
    else
      confirm = @view.confirm_purchase(item, price, @player.name)
      if confirm
        # Check if potion is good
        if price == 999
          slow_dialogue("#{'The shopkeeper smiles and hands you'.light_black} #{item.to_s.light_blue}#{'.'.light_black}", 0.02, false)
          @player.gold += 2999 unless @purchased_waste_of_money
          @player.recipes[:'wayee stamuhnee'] = ['gold', 'silver'] unless @purchased_waste_of_money
          @purchased_waste_of_money = true
        else
          slow_dialogue("#{'The shopkeeper grins as he hands you'.light_black} #{item.to_s.light_blue}#{'.'.light_black}", 0.02, false)
          @player.purchased_bad_potions = true
        end
        puts ''
        slow_dialogue("Shopkeeper #{'>'.blue} Thanks#{','.blue} appreciate the business#{'!'.blue}", 0.008, false)
        @player.gold -= price
        continue_prompt
      elsif confirm == false
        clear
        shop_for_potions
      else
        clear
        @view.invalid_option
        clear
        purchase_potion(price, item)
      end
    end
  end

  # Displays advice for purchase, checks if player has enough gold, adds potion to inventory.
  def shop_for_advice
    @view.display_advice
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
    purchase_advice(choice)
  end

  # Checks if player has enough gold, adds advice to inventory.
  def purchase_advice(price)
    return if price == 9
    valid_prices = [10, 26, 40, 50, 100, 101, 120, 150, 300, 500, 1000, 10_000]
    if insufficient_funds(price)
      @view.insufficient_funds
      continue_prompt
    elsif valid_prices.include?(price)
      confirm = @view.confirm_purchase('a piece of advice', price, @player.name)
      if confirm
        case price
        when 10
          @player.shopkeeper_advice << 'Inventory: All customization is done inside of your Inventory, including your name.'
          slow_dialogue("Shopkeeper #{'>'.blue} All customization is done inside of your #{'Inventory'.light_black}, including your name.", 0.03, false)
        when 26
          @player.shopkeeper_advice << "Easter egg: There's a hidden easter egg in one of the menus."
          slow_dialogue("Shopkeeper #{'>'.blue} There's a hidden #{'easter egg'.cyan} in one of the menus.", 0.03, false)
        when 40
          @player.shopkeeper_advice << "Explore: When you've found every ingredient while exploring, you'll get a free hint on how to create the final potion."
          slow_dialogue("Shopkeeper #{'>'.blue} When you've found every ingredient while #{'exploring'.light_green}, you'll get a free hint on how to create the #{'final potion'.red}.", 0.03, false)
        when 50
          @player.shopkeeper_advice << 'Billywig: The odds of Billywig are against you, but if you manage to get 21, you can a nice profit.'
          slow_dialogue("Shopkeeper #{'>'.blue} The odds of #{'Billywig'.light_blue} are against you, but if you manage to get 21, you can a nice profit.", 0.03, false)
        when 100
          @player.shopkeeper_advice << "Shop: If I had to make a recommendation, hmm... I'd say buy my most expensive potion!! AHIII hi hi hii..."
          slow_dialogue("Shopkeeper #{'>'.blue} If I had to make a recommendation, hmm... I'd say buy my most expensive potion!! AHIII hi hi hii...", 0.03, false)
        when 101
          @player.shopkeeper_advice << "Cheat codes: You can change your name for secret hidden loot. Try changing your name to 'Witch' for example."
          slow_dialogue("Shopkeeper #{'>'.blue} You can change your name for #{'secret'.blue} hidden loot. Try changing your name to '#{'Witch'.blue}' for example.", 0.03, false)
        when 120
          @player.shopkeeper_advice << 'Simple potion: One ingredient in shop + one ingredient in the labyrinth = M.M.'
          slow_dialogue("Shopkeeper #{'>'.blue} One ingredient in #{'shop'.blue} + one ingredient in the #{'labyrinth'.yellow} = #{'M.M.'.light_magenta}", 0.03, false)
        when 150
          @player.shopkeeper_advice << "Labyrinth tip 1: The south west and north east are dangerous, make sure to keep moving, if you stand still you'll die."
          slow_dialogue("Shopkeeper #{'>'.blue} The south west and north east are #{'dangerous'.red}, make sure to keep moving, if you stand still you'll die.", 0.03, false)
        when 300
          @player.shopkeeper_advice << "Labyrinth tip 2: If you feel like you're in a dangerous area, leave the labyrinth and come back to save your gold."
          slow_dialogue("Shopkeeper #{'>'.blue} If you feel like you're in a #{'dangerous'.red} area, leave the labyrinth and come back to save your gold.", 0.03, false)
        when 500
          @player.shopkeeper_advice << "Complex potion: None of the ingredients in the 'Potion potion' are used in another potion."
          slow_dialogue("Shopkeeper #{'>'.blue} None of the ingredients in the '#{'Potion potion'.light_magenta}' are used in another potion.", 0.03, false)
        when 1000
          @player.shopkeeper_advice << "Labyrinth tip 3: Use the keyword 'info' in the labyrinth to get more info on your location."
          slow_dialogue("Shopkeeper #{'>'.blue} Use the keyword '#{'info'.yellow}' in the labyrinth to get more info on your location.", 0.03, false)
        when 10_000
          @player.shopkeeper_advice << 'Final potion: Vile vial of amortentia: [Bowl of smoke and embers, Mobile madness, Time potion]'
          slow_dialogue("Shopkeeper #{'>'.blue} I don't want to say this out loud, don't ask questions, just take this and read it when you get home, then #{'BURN'.light_red} it immediately!", 0.03, false)
          slow_dialogue('The shopkeeper hands you a slip of paper as he looks away...'.light_black, 0.04, false)
        end
        # sleep(1.5)
        puts ''
        slow_dialogue("Shopkeeper #{'>'.blue} Thanks#{','.blue} appreciate the business#{'!'.blue}", 0.008, false)
        @player.gold -= price
        continue_prompt
      elsif confirm == false
        clear
        shop_for_advice
      else
        clear
        @view.invalid_option
        clear
        purchase_advice(price)
      end
    else
      clear
      @view.invalid_option
      clear
      shop_for_advice
    end
  end

  # Displays advice for purchase, checks if player has enough gold.
  def shop_for_ingredients
    good_ingredient_prices = [20, 111, 210]
    bad_ingredient_prices = [0, 8, 15, 18, 32, 48, 56, 80, 105]
    @view.display_ingredients
    print "#{@player.name} #{'>'.blue}"
    choice = gets.chomp.to_i
    case choice
    when 1 then purchase_ingredient(@view.ingredients.values[0], @view.ingredients.keys[0])
    when 8 then purchase_ingredient(@view.ingredients.values[1], @view.ingredients.keys[1])
    when 15 then purchase_ingredient(@view.ingredients.values[2], @view.ingredients.keys[2])
    when 18 then purchase_ingredient(@view.ingredients.values[3], @view.ingredients.keys[3])
    when 20 then purchase_ingredient(@view.ingredients.values[4], @view.ingredients.keys[4])
    when 32 then purchase_ingredient(@view.ingredients.values[5], @view.ingredients.keys[5])
    when 48 then purchase_ingredient(@view.ingredients.values[6], @view.ingredients.keys[6])
    when 56 then purchase_ingredient(@view.ingredients.values[7], @view.ingredients.keys[7])
    when 80 then purchase_ingredient(@view.ingredients.values[8], @view.ingredients.keys[8])
    when 105 then purchase_ingredient(@view.ingredients.values[9], @view.ingredients.keys[9])
    when 111 then purchase_ingredient(@view.ingredients.values[10], @view.ingredients.keys[10])
    when 210 then purchase_ingredient(@view.ingredients.values[11], @view.ingredients.keys[11])
    # This will return user to previous menu, completing the case statement
    when 9 then nil
    else
      clear
      @view.invalid_option
      clear
      shop_for_ingredients
    end
  end

  # Checks if player has enough gold, adds ingredient to ingredients if it's valuable.
  def purchase_ingredient(price, item)
    if insufficient_funds(price)
      @view.insufficient_funds
      continue_prompt
    else
      confirm = @view.confirm_purchase(item, price, @player.name)
      if confirm
        # Check if ingredient is good or owned
        if @view.good_explore_ingredients.include?(item.to_s)
          slow_dialogue("#{'The shopkeeper smiles and hands you'.light_black} #{item.to_s.light_blue}#{'.'.light_black}", 0.02, false)
          @player.ingredients << item.to_s unless @player.ingredients.include?(item.to_s)
        else
          slow_dialogue("#{'The shopkeeper grins as he hands you'.light_black} #{item.to_s.light_blue}#{'.'.light_black}", 0.02, false)
          @player.purchased_bad_ingredients = true
        end
        puts ''
        slow_dialogue("Shopkeeper #{'>'.blue} Thanks#{','.blue} appreciate the business#{'!'.blue}", 0.008, false)
        @player.gold -= price
        continue_prompt
      elsif confirm == false
        clear
        shop_for_ingredients
      else
        clear
        @view.invalid_option
        clear
        purchase_ingredient(price, item)
      end
    end
  end
end
