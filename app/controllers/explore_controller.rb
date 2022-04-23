require_relative '../repo/ingredient_repo'
require_relative '../views/explore_view'

# Handles everything related to searching for ingredients.
class ExploreController < ParentController
  def initialize(ingredient_repo)
    super(player)
    @ingredient_repo = ingredient_repo
    @view = ExploreView.new
  end

  def run
    @running = true
    while @running
      @view.explore_menu_options
      print "#{@player.name}#{'> '.light_green}"
      action = gets.chomp.to_i
      clear
      route_action(action)
      clear
    end
  end

  private

  def route_action(action)
    case action
    when 1 then search_route_action
    when 2 then check_ingredients
    when 3 then tutorial
    when 9 then stop
    else
      @view.invalid_option
      clear
    end
  end

  def search_route_action
    searching = true
    while searching
      clear
      @view.title_art
      searching_loop
      found_ingredient
      clear
      @view.search_again_text
      print "#{@player.name}#{'> '.light_green}"
      action = gets.chomp.to_i
      searching = false if action == 9
    end
  end

  # Displays dialogue on how to search for ingredients.
  def tutorial
    clear
    puts @view.title_art.light_green.blink
    line
    slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".green} #{@view.tutorial}", 0.010, true)
  end

  def check_ingredients
    puts @view.title_art.light_green.blink
    puts ''
    @view.quick_view_ingredients(@player.ingredients)
    continue_prompt
  end

  def stop
    @running = false
  end

  def one_ingredient_found
    ingredient_found = find_and_delete_ingredient
    @ingredients_found = [ingredient_found]
  end

  def two_ingredients_found
    ingredient_found_one = find_and_delete_ingredient
    ingredient_found_two = find_and_delete_ingredient
    @ingredients_found = [ingredient_found_one, ingredient_found_two]
  end

  def three_ingredients_found
    ingredient_found_one = find_and_delete_ingredient
    ingredient_found_two = find_and_delete_ingredient
    ingredient_found_three = find_and_delete_ingredient
    @ingredients_found = [ingredient_found_one, ingredient_found_two, ingredient_found_three]
  end

  def how_many_ingredients_found
    if @ingredient_repo.all_ingredients.length == 2
      @magic_number == rand(1..2)
    elsif @ingredient_repo.all_ingredients.length == 1
      @magic_number = 1
    else
      @magic_number = rand(1..3)
    end
    case @magic_number
    when 1 then one_ingredient_found
    when 2 then two_ingredients_found
    when 3 then three_ingredients_found
    end
  end

  def found_ingredient
    # Find random ingredient
    if @ingredient_repo.all_ingredients.empty?
      puts ''
      slow_dialogue("#{'Gʀᴜɴᴛɪʟᴅᴀ> '.green}Well that seems to be the last of them, ", 0.015, false)
      slow_dialogue("#{'Gʀᴜɴᴛɪʟᴅᴀ> '.green}guess we'd better start makin' some potions.", 0.015, false)
      sleep(0.25)
      damaged_final_recipe
    else
      # Determins how many ingredients are found, between 1 and 3 inclusive.
      how_many_ingredients_found
      found_ingredients_text(@ingredients_found)
      continue_prompt
    end
  end

  # Text displayed when 3 good items are found
  def three_good_ingredients_alert
    @player.gold += 10
    clear
    2.times do
      fill_screen("                                PERFECT SEARCH!!                          PERFECT SEARCH!!                                                                                                                                     ".black.on_green, 0.40)
      fill_screen("                                                                    PERFECT SEARCH!!                                PERFECT SEARCH!!                                                                                                    ".black.on_light_green, 0.40)
    end
    clear
    puts @view.title_art.light_green.blink
    puts ''
  end

  def found_ingredients_text(ingredients_found)
    # When 1 ingredient is found, display dialogue about the ingredient
    if ingredients_found.length == 1
      puts "You found #{ingredients_found.first}!"
      sleep(0.75)
      # Check to see if the ingredient can be used
      if @ingredient_repo.good_ingredients.include?(ingredients_found.first)
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.green} #{@view.good_ingredient_text.sample}"
        @player.ingredients << ingredients_found.first unless @player.ingredients.include?(ingredients_found.first)
      else
        # Ingredient is bad and can't be used
        puts ''
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.green} #{@view.bad_ingredient_text.sample}"
      end
    else
      # Checks to see if it's a good or bad item.
      @good_ingredients_count = 0
      ingredients_found.each do |ingredient|
        if @ingredient_repo.good_ingredients.include?(ingredient)
          @good_ingredients_count += 1
          @player.ingredients << ingredient unless @player.ingredients.include?(ingredient)
        end
      end
      three_good_ingredients_alert if @good_ingredients_count == 3
      @view.multiple_ingredients_found_text(@ingredients_found)
      @view.how_many_good_ingredients_found(@good_ingredients_count, ingredients_found.length)
    end
  end

  def find_and_delete_ingredient
    ingredient_found = @ingredient_repo.all_ingredients.sample
    @ingredient_repo.all_ingredients.delete(ingredient_found)
    ingredient_found
  end

  def searching_loop
    searching_time = rand(15..60)
    @player.gold += rand(4..8)
    puts @view.title_art.light_green.blink
    puts ''
    # Put message saying searching while walking
    slow_dialogue('Nᴏᴡ Sᴇᴀʀᴄʜɪɴɢ'.light_green.blink, 0.015, false)

    # Add random delay between each item found.
    searching_time.times do
      print '.'.light_green
      sleep(0.010)
      print '.'.light_black
      sleep(0.010)
    end
  end

  # Method that adds ingredient to the ingredients inventory, unless already owned
  def add_ingredient(ingredient)
    @ingredients << ingredient unless @ingredients.include?(ingredient)
  end

  def damaged_final_recipe
    slow_dialogue('You recall the damaged recipe you found earlier and pretended to discard,'.light_black, 0.020, false)
    slow_dialogue("you retrieve it from your pocket and read it when Grunty isn't looking...".light_black, 0.030, false)
    @view.read_damaged_recipe
    continue_prompt
  end
end
