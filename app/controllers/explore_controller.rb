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
    when 1
      search_route_action
    when 2
      check_ingredients
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

  def check_ingredients
    puts @view.title_art.light_green.blink
    puts ''
    @view.quick_view_ingredients(@player.ingredients)
    continue_prompt
  end

  def stop
    @running = false
  end

  def found_ingredient
    # Find random ingredient
    if @ingredient_repo.all_ingredients.empty?
      slow_dialogue('Well that seems to be the last of them, ', 0.015, false)
      slow_dialogue("guess we'd better start makin' some potions.", 0.015, false)
      sleep(0.5)
      damaged_final_recipe
    else
      ingredient_found = @ingredient_repo.all_ingredients.sample
      @ingredient_repo.all_ingredients.delete(ingredient_found)

      # When item is found, display dialogue about the item
      puts "You found #{ingredient_found}!"
      sleep(1.5)

      # Checks to see if it's a good or bad item.
      puts ''
      if @ingredient_repo.good_ingredients.include?(ingredient_found)
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} #{@view.good_ingredient_text.sample}"
        @player.ingredients << ingredient_found unless @player.ingredients.include?(ingredient_found)
      else
        puts ''
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} #{@view.bad_ingredient_text.sample}"
      end
      line(1)
      continue_prompt
    end
  end

  def searching_loop
    searching_time = rand(10..30)
    puts @view.title_art.light_green.blink
    puts ''
    # Put message saying searching while walking
    slow_dialogue('Nᴏᴡ Sᴇᴀʀᴄʜɪɴɢ'.light_green.blink, 0.015, false)

    # Add random delay between each item found.
    searching_time.times do
      print '.'.light_green
      sleep(0.050)
      print '.'.light_black
      sleep(0.050)
    end
    sleep(1.25)
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
