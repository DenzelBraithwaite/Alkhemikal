require_relative 'basic_controller'
require_relative '../repo/ingredient_repo'
require_relative '../repo/potion_repo'
require_relative '../views/potion_making_view'

class PotionController < BasicController
  def initialize(ingredient_repo, potion_repo)
    super(player)
    @view = PotionMakingView.new
    @ingredient_repo = IngredientRepo.new
    @potion_repo = PotionRepo.new
    @intro_message_completed = false
    @already_upgraded = false
  end

  def run
    @running = true
    # run_tutorial
    while @running
      clear
      @view.menu_options
      @view.current_equipment(@player.ladle, @player.cauldron)
      print "#{@player.name}#{'> '.light_magenta}"
      action = gets.chomp.to_i
      clear
      puts @view.title_art.light_magenta
      route_action(action)
    end
  end

  def route_action(action)
    case action
    when 1
      if enough_ingredients?
        create_potion
        clear
        potion_making_again_text
        print "#{@player.name}#{'> '.light_magenta}"
        action = gets.chomp.to_i
        still_cooking if action == 1
      else
        not_enough_ingredients
      end
    when 2 then check_ingredients
    when 3 then check_recipes
    when 4 then play_tutorial
    when 9 then @running = false
    else
      @view.invalid_option
      clear
    end
  end

  def create_potion
    potion_making_reset
    upgrade_equipment
    potions_loop
  end

  def check_ingredients
    @view.quick_view_ingredients(@player.ingredients)
    continue_prompt
  end

  def check_recipes
    view_recipes
  end

  def play_tutorial
    slow_dialogue(@view.potion_tutorial_1, 0.01, true)
    clear
    puts @view.title_art.light_magenta
    slow_dialogue(@view.potion_tutorial_2, 0.01, false)
    slow_dialogue(":Bʀᴇᴡ ᴏғ Bᴇɢɪɴɴɪɴɢs => [ᴡᴀᴛᴇʀ, sᴍᴀʟʟ ʙᴏɴᴇs]", 0.025, true).light_black
    clear
  end

  def run_tutorial
    if @intro_message_completed == false
      puts @view.intro_message
      continue_prompt
    end
    @intro_message_completed = true if @intro_message_completed == false
  end

  def potions_loop
    add_ingredients_to_pot
    create_recipe
  end

  # Loops back into making potions or returns to menu
  def still_cooking
    cooking_again = true
    while cooking_again
      clear
      potions_loop
      clear
      potion_making_again_text
      print "#{@player.name}#{'> '.light_magenta}"
      action = gets.chomp.to_i
      cooking_again = false unless action == 1
    end
  end

  # Method that adds a potion to the potions inventory, unless already created.
  def add_potion(potion)
    @potions << potion unless @potions.include?(potion)
  end

  # Check if player has created all potions, upgrade equipment if true.
  def upgrade_equipment
    return if @already_upgraded
    return if @player.recipes.length != @potion_repo.all_potions.length

    # slow_dialogue(@view.upgrade(@player.name), 0.025, true)
    @player.upgrade_cauldron
    # sleep(3.5)
    @player.upgrade_ladle
    # sleep(3.5)
    continue_prompt
    @already_upgraded = true
    clear
  end

  def potion_making_reset
    # First ingredient added to pot
    @first_ingredient = ""

    # Second ingredient added to pot
    @second_ingredient = ""

    # Time it takes to make potion
    @potion_making_time = rand(10..50)
  end

  def enough_ingredients?
    @player.ingredients.length >= 2
  end


  def not_enough_ingredients
    clear
    @view.quick_view_ingredients(player.ingredients)
    5.times {line}
    puts "You need at least 2 ingredients to make potions".light_red
    continue_prompt
  end

  def add_ingredients_to_pot
    clear
    # display title art and list all owned ingredients.
    puts @view.title_art.light_magenta
    @view.quick_view_ingredients(@player.ingredients)

    # Add first ingredient
    @view.first_ingredient
    @first_ingredient_index = gets.chomp.to_i
    select_first_ingredient

    # display title art and list all owned ingredients.
    # @view.quick_view_ingredients(@player.ingredients)

    # Add second ingredient
    @view.second_ingredient
    @second_ingredient_index = gets.chomp.to_i
    select_second_ingredient
  end

  def select_first_ingredient
    # Reprompt if index is 0 or greater than number of ingredients owned
    if @first_ingredient_index > @player.ingredients.length || @first_ingredient_index == 0
      # Add first ingredient again until it is valid.
      clear
      @view.invalid_option
      first_ingredient_prompt
    else
      # sets first ingredient to selected index
      @first_ingredient = @player.ingredients[@first_ingredient_index - 1]
      # list first ingredient added.
      puts ""
      puts "#{@first_ingredient} added to the pot...".light_black
      line(0.75)
    end
  end

  # Clears the screen, prompts user to add the first ingredient
  def first_ingredient_prompt
    clear
    puts @view.title_art.light_magenta
    @view.quick_view_ingredients(@player.ingredients)
    @view.first_ingredient
    @first_ingredient_index = gets.chomp.to_i
    select_first_ingredient
  end

  def select_second_ingredient
    # Reprompt if index is 0 or greater than number of ingredients owned
    if @second_ingredient_index > @player.ingredients.length || @second_ingredient_index == 0
      clear
      @view.invalid_option
      clear
      second_ingredient_prompt
    # Reprompt if index issame as first ingredient index
    elsif @first_ingredient_index == @second_ingredient_index
      clear
      @view.duplicate_ingredients
      clear
      # Add second ingredient again until it is not same as first ingredient.
      second_ingredient_prompt
    else
      clear
      puts @view.title_art.light_magenta
      # sets second ingredient to selected index
      @second_ingredient = @player.ingredients[@second_ingredient_index - 1]
      puts ""
      puts "#{@second_ingredient.light_cyan} #{"added to the pot with".light_black} #{@first_ingredient.light_cyan}#{"...".light_black}"
      line(0.75)
    end
  end

  # Clears the screen, prompts user to add the second ingredient
  def second_ingredient_prompt
    puts @view.title_art.light_magenta
    @view.quick_view_ingredients(@player.ingredients)
    puts "#{@first_ingredient} added to the pot...".light_black
    puts ""
    @view.second_ingredient
    @second_ingredient_index = gets.chomp.to_i
    clear
    select_second_ingredient
  end

  def create_recipe
    recipe = [@first_ingredient, @second_ingredient]
    # Put message saying making potions ....
    slow_dialogue("Mᴀᴋɪɴɢ ᴘᴏᴛɪᴏɴ".light_magenta.blink, delay = 0.015, false)
    # Add random delay between each potion made.
    @potion_making_time.times do
      print ".".light_magenta
      sleep(0.050)
      print ".".light_black
      sleep(0.050)
    end
    sleep(1.25)

    # Loops through all potions to see if you matched a recipe
    no_matches = true
    @potion_repo.all_potion_recipes.each do |potion, ingredients|
      if ingredients.include?(recipe[0]) && ingredients.include?(recipe[1])
        # Display text after creating the potion
        puts "You've created the #{potion.to_s.light_cyan}!" # Add ingredient descriptions after
        sleep(1.5)

        # Check if potion exists in player recipes, don't add it if it does.
        if @player.recipes.key?(potion)
          puts "You've already created this"
          no_matches = false
          line(0, 3)
          continue_prompt
        else
          puts @view.good_potion_text.sample
          puts "Congrats, a new potion!"
          @player.recipes[potion] = ingredients
          recipe.each { |ingredient| @player.ingredients.delete(ingredient) }
          no_matches = false
          line(0, 3)
          continue_prompt
        end
      end
    end

    if no_matches == true
      line
      puts @view.bad_potion_text.sample
      sleep(2)
    end

    slow_dialogue("Cʟᴇᴀɴɪɴɢ ᴇᴏqᴜɪᴘᴍᴇɴᴛ ᴀɴᴅ sᴛᴀʀᴛɪɴɢ ᴏᴠᴇʀ...".light_black, 0.015, false)
    # Breaks loop
    creating_potions = false
  end
  ########################################################################################################
  # Text displayed to prompt search again
  def potion_making_again_text
    puts @view.title_art.light_magenta.blink
    puts ""
    puts ""
    puts " Wᴏᴜʟᴅ ʏᴏᴜ ʟɪᴋᴇ ᴛᴏ ᴄᴏɴᴛɪɴᴜᴇ ᴍᴀᴋɪɴɢ ᴘᴏᴛɪᴏɴs #{'?'.light_magenta}"
    puts ""
    sleep(1)
    puts " 𝟙 #{'-'.light_magenta} 𝕪𝕖𝕤"
    puts ""
    sleep(0.5)
    puts " 𝟚 #{'-'.light_magenta} #{'𝕟𝕠'.light_red}"
    sleep(1)
    puts ""
    puts ""
  end


  #====================================================================#
  #----------------------Unlocked ingredients--------------------------#
  #====================================================================#

  def view_unlocked_ingredients_green
    slow_dialogue("Checking ingredients...", 0.02, false)
    sleep(0.5)
    clear
    puts ingredients_art.green
    line
    @player.ingredients.each_with_index do |ingredient, index|
      puts "#{index + 1} #{'-'.green} #{ingredient}"
      sleep(0.15)
    end
    line
    puts "end".light_red
    line
    continue_prompt
  end

  def view_unlocked_ingredients_magenta
    slow_dialogue("Checking ingredients...", 0.02, false)
    sleep(0.5)
    clear
    puts ingredients_art.magenta
    line
    @player.ingredients.each_with_index do |ingredient, index|
      puts "#{index + 1} #{'-'.light_magenta} #{ingredient}"
      sleep(0.15)
    end
    line
    puts "end".light_red
    line
    continue_prompt
  end

  def view_recipes
    slow_dialogue("Checking recipes...", 0.02, false)
    sleep(0.5)
    clear
    puts @view.recipes_art.light_magenta
    line
    @player.recipes.each_with_index do |potion, index|
      puts "#{index + 1} #{'-'.light_magenta} #{potion}"
      sleep(0.15)
    end
    line
    puts "end".light_red
    line
    continue_prompt
  end
end
