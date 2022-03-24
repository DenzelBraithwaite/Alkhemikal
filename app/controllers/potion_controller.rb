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
      print "#{@player.name}#{'> '.light_magenta.blink}"
      action = gets.chomp.to_i
      clear
      puts @view.title_art.light_magenta.blink
      route_action(action)
    end
  end

  def route_action(action)
    case action
    when 1
      if enough_ingredients?
        create_which_potion
        clear
        potion_making_again_text
        print "#{@player.name}#{'> '.light_magenta.blink}"
        action = gets.chomp.to_i
        still_cooking if action == 1
      elsif @player.recipes.length == @potion_repo.all_potions.length
        upgrade_equipment
        create_which_potion
      else
        not_enough_ingredients
      end
    when 2 then check_ingredients
    when 3 then view_recipes
    when 4 then play_tutorial
    when 9 then @running = false
    else
      @view.invalid_option
      clear
    end
  end

  def create_which_potion
    if @already_upgraded
      puts "Do you want to make a simple potion or a complex potion?"
      puts ""
      puts "1 for simple"
      puts "2 for complex"
      print "> "
      action = gets.chomp.to_i
      case action
      when 1
        puts "you chose simple"
        enough_ingredients? ? create_simple_potion : not_enough_ingredients
      when 2
        puts "you chose complex"
        create_complex_potion
      else
        clear
        create_which_potion
      end
    else
      create_simple_potion
    end
  end

  def play_tutorial
    slow_dialogue(@view.potion_tutorial_1, 0.01, true)
    clear
    puts @view.title_art.light_magenta.blink
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

  def check_ingredients
    clear
    puts @view.ingredients_art.light_magenta.blink
    puts ""
    @view.quick_view_ingredients(@player.ingredients)
    continue_prompt
  end

  # Loops back into making potions or returns to menu
  def still_cooking
    cooking_again = true
    while cooking_again
      clear
      if @already_upgraded
        create_which_potion
      elsif enough_ingredients?
        create_simple_potion
      else
        not_enough_ingredients
      end
      clear
      potion_making_again_text
      print "#{@player.name}#{'> '.light_magenta.blink}"
      action = gets.chomp.to_i
      cooking_again = false unless action == 1
    end
  end

  # Method that adds a potion to the potions inventory, unless already created.
  def add_potion(potion)
    @potions << potion unless @potions.include?(potion)
  end

  def enough_ingredients?
    @player.ingredients.length >= 2
  end


  def not_enough_ingredients
    clear
    puts @view.title_art.light_magenta.blink
    puts ""
    @view.quick_view_ingredients(player.ingredients)
    5.times {line}
    puts "You need at least 2 ingredients to make potions".light_red
    continue_prompt
  end

  # Text displayed to prompt search again
  def potion_making_again_text
    puts @view.title_art.light_magenta.blink.blink
    puts ""
    puts ""
    puts " Wᴏᴜʟᴅ ʏᴏᴜ ʟɪᴋᴇ ᴛᴏ ᴄᴏɴᴛɪɴᴜᴇ ᴍᴀᴋɪɴɢ ᴘᴏᴛɪᴏɴs #{'?'.light_magenta.blink}"
    puts ""
    sleep(1)
    puts " 𝟙 #{'-'.light_magenta.blink} 𝕪𝕖𝕤"
    puts ""
    sleep(0.5)
    puts " 𝟚 #{'-'.light_magenta.blink} #{'𝕟𝕠'.light_red}"
    sleep(1)
    puts ""
    puts ""
  end

  def view_recipes
    clear
    puts @view.recipes_art.light_magenta.blink
    puts ""
    slow_dialogue("Checking recipes...".light_black, 0.02, false)
    sleep(0.25)
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

  ##############################################################
  #--------------------Simple Potion Making--------------------#
  ##############################################################

  def create_simple_potion
    simple_potion_making_reset
    upgrade_equipment
    add_simple_ingredients_to_pot
    create_simple_recipe
  end

  # Resests ingredients and sets brewing time
  def simple_potion_making_reset
    # First ingredient added to pot
    @first_simple_ingredient = ""

    # Second ingredient added to pot
    @second_simple_ingredient = ""

    # Time it takes to make potion
    @potion_making_time = rand(10..55)
  end

  def add_simple_ingredients_to_pot
    clear
    # display title art and list all owned ingredients.
    puts @view.title_art.light_magenta.blink
    @view.quick_view_ingredients(@player.ingredients)

    # Add first ingredient
    @view.first_ingredient
    @first_simple_ingredient_index = gets.chomp.to_i
    select_first_simple_ingredient

    # Add second ingredient
    @view.second_ingredient
    @second_simple_ingredient_index = gets.chomp.to_i
    select_second_simple_ingredient
  end

  def select_first_simple_ingredient
    # Reprompt if index is 0 or greater than number of ingredients owned
    if @first_simple_ingredient_index > @player.ingredients.length || @first_simple_ingredient_index <= 0
      # Add first ingredient again until it is valid.
      clear
      @view.invalid_option
      first_simple_ingredient_prompt
    else
      # sets first ingredient to selected index
      @first_simple_ingredient = @player.ingredients[@first_simple_ingredient_index - 1]
      # list first ingredient added.
      puts ""
      puts "#{@first_simple_ingredient} added to the pot...".light_black
      line(0.75)
    end
  end

  # Clears the screen, prompts user to add the first ingredient
  def first_simple_ingredient_prompt
    clear
    puts @view.title_art.light_magenta.blink
    @view.quick_view_ingredients(@player.ingredients)
    @view.first_ingredient
    @first_simple_ingredient_index = gets.chomp.to_i
    select_first_simple_ingredient
  end

  def select_second_simple_ingredient
    # Reprompt if index is 0 or greater than number of ingredients owned
    if @second_simple_ingredient_index > @player.ingredients.length || @second_simple_ingredient_index <= 0
      clear
      @view.invalid_option
      clear
      second_simple_ingredient_prompt
    # Reprompt if index issame as first ingredient index
    elsif @first_simple_ingredient_index == @second_simple_ingredient_index
      clear
      @view.duplicate_ingredients
      clear
      # Add second ingredient again until it is not same as first ingredient.
      second_simple_ingredient_prompt
    else
      clear
      puts @view.title_art.light_magenta.blink
      # sets second ingredient to selected index
      @second_simple_ingredient = @player.ingredients[@second_simple_ingredient_index - 1]
      puts ""
      puts "#{@second_simple_ingredient.light_cyan} #{"added to the pot with".light_black} #{@first_simple_ingredient.light_cyan}"
      line(0.75)
    end
  end

  # Clears the screen, prompts user to add the second ingredient
  def second_simple_ingredient_prompt
    puts @view.title_art.light_magenta.blink
    @view.quick_view_ingredients(@player.ingredients)
    puts "#{@first_simple_ingredient} added to the pot...".light_black
    puts ""
    @view.second_ingredient
    @second_simple_ingredient_index = gets.chomp.to_i
    clear
    select_second_simple_ingredient
  end

  def create_simple_recipe
    @simple_recipe = [@first_simple_ingredient, @second_simple_ingredient]
    # Put message saying making potions ....
    slow_dialogue("Mᴀᴋɪɴɢ ᴘᴏᴛɪᴏɴ".light_magenta.blink.blink, delay = 0.015, false)
    # Add random delay between each potion made.
    @potion_making_time.times do
      print ".".light_magenta.blink
      sleep(0.050)
      print ".".light_black
      sleep(0.050)
    end
    sleep(1.25)
    does_recipe_exist
    slow_dialogue("Cʟᴇᴀɴɪɴɢ ᴇᴏqᴜɪᴘᴍᴇɴᴛ ᴀɴᴅ sᴛᴀʀᴛɪɴɢ ᴏᴠᴇʀ...".light_black, 0.015, false)
    # Breaks loop
  end

  def does_recipe_exist
    # Loops through all potions to see if you matched a recipe
    no_matches = true
    @potion_repo.all_potion_recipes.each do |potion, ingredients|
      if ingredients.include?(@simple_recipe[0]) && ingredients.include?(@simple_recipe[1])
        # Display text after creating the potion
        puts "You've created the #{potion.to_s.light_cyan}!" # Add ingredient descriptions after
        sleep(1.5)

        # Check if potion exists in player recipes, don't add it if it does.
        if @player.recipes.key?(potion)
          puts "You've already created this"
        else
          puts @view.good_potion_text.sample
          puts "Congrats, a new potion!"
          @player.recipes[potion] = ingredients
          recipe.each { |ingredient| @player.ingredients.delete(ingredient) }
        end
        no_matches = false
        line(0, 3)
        continue_prompt
      end
    end

    if no_matches == true
      puts ""
      puts @view.bad_potion_text.sample
      sleep(2)
    end
  end

  ##############################################################
  #--------------------Complex Potion Making-------------------#
  ##############################################################

  def create_complex_potion
    complex_potion_making_reset
    add_complex_ingredients_to_pot
    create_complex_recipe
  end

  def complex_potion_making_reset
    # First ingredient added to pot
    @first_complex_ingredient = ""

    # Second ingredient added to pot
    @second_complex_ingredient = ""

    # Second ingredient added to pot
    @third_complex_ingredient = ""

    # Time it takes to make potion
    @potion_making_time = rand(20..75)
  end

  def add_complex_ingredients_to_pot
    clear
    # display title art and list all owned potions.
    puts @view.title_art.light_magenta.blink
    @view.quick_view_potions_as_ingredients(@player.recipes.keys)

    # Add first potion / ingredient
    @view.first_ingredient
    @first_complex_ingredient_index = gets.chomp.to_i
    select_first_complex_ingredient

    # Add second potion / ingredient
    @view.second_ingredient
    @second_complex_ingredient_index = gets.chomp.to_i
    select_second_complex_ingredient

    # Add third potion / ingredient
    @view.third_ingredient
    @third_complex_ingredient_index = gets.chomp.to_i
    select_third_complex_ingredient
  end

  # Clears the screen, prompts user to add the first potion / ingredient
  def first_complex_ingredient_prompt
    clear
    puts @view.title_art.light_magenta.blink
    @view.quick_view_potions_as_ingredients(@player.recipes.keys)
    @view.first_ingredient
    @first_complex_ingredient_index = gets.chomp.to_i
    select_first_complex_ingredient
  end

  def select_first_complex_ingredient
    # Reprompt if index is 0 or greater than number of potions owned
    if @first_complex_ingredient_index > @player.recipes.length || @first_complex_ingredient_index <= 0
      # Add first potion / ingredient again until it is valid.
      clear
      @view.invalid_option
      first_complex_ingredient_prompt
    else
      # sets first potion / ingredient to selected index
      @first_complex_ingredient = return_key_for_index(@first_complex_ingredient_index - 1, @player.recipes)
      # list first potion / ingredient added.
      puts ""
      puts @first_complex_ingredient
      puts "#{@first_complex_ingredient.to_s} added to the pot...".light_black
      line(0.75)
    end
  end

  # Clears the screen, prompts user to add the second potion / ingredient
  def second_complex_ingredient_prompt
    puts @view.title_art.light_magenta.blink
    @view.quick_view_potions_as_ingredients(@player.recipes.keys)
    puts "#{@first_complex_ingredient.to_s} added to the pot...".light_black
    puts ""
    @view.second_ingredient
    @second_complex_ingredient_index = gets.chomp.to_i
    clear
    select_second_complex_ingredient
  end

  def select_second_complex_ingredient
    # Reprompt if index is 0 or greater than number of potions owned
    if @second_complex_ingredient_index > @player.recipes.length || @second_complex_ingredient_index <= 0
      clear
      @view.invalid_option
      clear
      second_complex_ingredient_prompt
    # Reprompt if index is same as first potion / ingredient index
    elsif @first_complex_ingredient_index == @second_complex_ingredient_index
      clear
      @view.duplicate_ingredients
      clear
      # Add second potion / ingredient again until it is not same as first potion / ingredient.
      second_complex_ingredient_prompt
    else
      clear
      puts @view.title_art.light_magenta.blink
      # sets second ingredient to selected index
      @second_complex_ingredient = return_key_for_index(@second_complex_ingredient_index - 1, @player.recipes)
      puts ""
      puts "#{@first_complex_ingredient.to_s} added to the pot...".light_black
      puts "#{@second_complex_ingredient.to_s.light_cyan} #{"added to the pot with".light_black} #{@first_complex_ingredient.to_s.light_cyan}"
      line(0.75)
    end

    def select_third_complex_ingredient
      # Reprompt if index is 0 or greater than number of potions owned
      if @third_complex_ingredient_index > @player.recipes.length || @third_complex_ingredient_index <= 0
        clear
        @view.invalid_option
        clear
        third_complex_ingredient_prompt
      # Reprompt if index is same as first potion / ingredient index
      elsif @first_complex_ingredient_index == @third_complex_ingredient_index
        clear
        @view.duplicate_ingredients
        clear
        # Add third potion / ingredient again until it is not same as first potion / ingredient.
        third_complex_ingredient_prompt
      else
        clear
        puts @view.title_art.light_magenta.blink
        # sets third ingredient to selected index
        @third_complex_ingredient = return_key_for_index(@third_complex_ingredient_index - 1, @player.recipes)
        puts ""
        puts "#{@first_complex_ingredient.to_s} added to the pot...".light_black
        puts "#{@third_complex_ingredient.to_s.light_cyan} #{"added to the pot with".light_black} #{@first_complex_ingredient.to_s.light_cyan}"
        line(0.75)
      end
  end
end
