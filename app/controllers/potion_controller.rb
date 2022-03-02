require_relative 'basic_controller'
require_relative '../repo/ingredient_repo'
require_relative '../repo/potion_repo'
require_relative '../views/potion_making_view'

class PotionController < BasicController
    def initialize(ingredient_repo, potion_repo)
        @view = PotionMakingView.new
        @ingredient_repo = IngredientRepo.new
        @potion_repo = PotionRepo.new
        @intro_message_completed = false
    end

    def run
        @running = true
        if @intro_message_completed == false
          puts @view.intro_message
          continue_prompt
        end
          @intro_message_completed = true if @intro_message_completed == false

        while @running
            clear
            @view.menu_options
            print "#{@player.name}> ".magenta
            action = gets.chomp.to_i
            clear
            puts @view.title_art.light_magenta
            route_action(action)
        end
    end
    
    def route_action(action)
        case action
        when 1 then create_potion
        when 2 then check_ingredients
        when 3 then check_recipes
        when 4 then play_tutorial
        when 9 then @running = false
        else
            puts "Invalid option"
        end
    end

    def create_potion
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
      slow_dialogue(":Brew of Beginnings => [water, small bones]", 0.025, true).light_black
      clear
    end


  

	# Method that adds a potion to the potions inventory, unless already created.
	def add_potion(potion)
		@potions << potion unless @potions.include?(potion)
	end

  ########################################################################################################
  def potions_loop
    creating_potions = true
    while creating_potions == true
      # Time it takes to make potion
      first_ingredient = ""
      second_ingredient = ""
      potion_making_time = rand(10..50)
      while first_ingredient == second_ingredient
        # View ingredients
        clear
        puts @view.title_art.light_magenta.blink
        if @player.ingredients.length < 2
          @view.quick_view_ingredients(player.ingredients)
          5.times {line}
          puts "You need at least 2 ingredients to make potions".light_red
          continue_prompt
          break
        end
  
        @view.quick_view_ingredients(@player.ingredients)
  
        # Add first ingredient
        puts "First ingredient?".light_cyan
        first_ingredient = gets.chomp.downcase
              
        until @player.ingredients.include?(first_ingredient)
          puts "You need to add ingredients you actually own...".light_black
          sleep(1.25)
          clear
          puts @view.title_art.light_magenta.blink
          @view.quick_view_ingredients(@player.ingredients)
          puts "First ingredient?".light_cyan
          first_ingredient = gets.chomp.downcase
        end
        puts "#{first_ingredient} added to the pot...".light_black
        line(0.75)
  
        # Add second ingredient
        puts "second ingredient?".light_cyan
        second_ingredient = gets.chomp.downcase
        
        until @player.ingredients.include?(second_ingredient)
          puts "You need to add ingredients you actually own...".light_black
          sleep(1.25)
          clear
          puts @view.title_art.light_magenta.blink
          @view.quick_view_ingredients(@player.ingredients)
          puts "#{first_ingredient} added to the pot...".light_black
          line
          puts "second ingredient?".light_cyan
          second_ingredient = gets.chomp.downcase
        end
        puts "#{second_ingredient} added to the pot...".light_black
        line(0.75)
      
        if first_ingredient == second_ingredient
          puts "Gruntilda> No you DINGBAT!! You can't use the same ingredient twice! That's like only using 1 ingredient"
          sleep(1)
          puts "Emptying pot...".light_black
        end
      end # 429 While loop end
      
      recipe = [first_ingredient, second_ingredient]
      unless recipe == ["", ""] #SKIP THE REST AND GO BACK TO MAIN LOOP
  
        # Put message saying making potions .... 
        slow_dialogue("Making potions", delay = 0.015, false)
  
        # Add random delay between each potion made.
        potion_making_time.times do
          print ".".light_magenta
          sleep(0.050)
          print ".".magenta
          sleep(0.050)
        end
        sleep(1.25)
        
        # If all potions have been unlocked
        if @potion_repo.all_potions.all? do |potion|
            # Check if the potion is included in the players recipes
            @player.recipes.key?(potion)
          end
          puts "Gruntilda> Hot Billywig! You've mastered all the potions!! Feel welcome to use the cauldron as much as you want" 
        end
  
        # Loops through all potions to see if you matched a recipe
        no_matches = true
        @potion_repo.all_potion_recipes.each do |potion, ingredients|
          if ingredients.include?(recipe[0]) && ingredients.include?(recipe[1])
            # Display text after creating the potion
            puts "You've created the #{potion}!" # Add ingredient descriptions after
            sleep(1.5)
  
            # Check if potion exists in player recipes, don't add it if it does.
            if @player.recipes.key?(potion)
              puts "You've already created this"
              no_matches = false
              continue_prompt
            else
              puts @view.good_potion_text.sample
              puts "Congrats, a new potion!"
              @player.recipes[potion] = ingredients
              recipe.each { |ingredient| @player.ingredients.delete(ingredient) }
              no_matches = false
              continue_prompt
            end
          end
        end # Ends line 508
  
        if no_matches == true
          line
          puts @view.bad_potion_text.sample
          sleep(2)
        end 
  
        slow_dialogue("Cleaning equipment and starting over...", 0.015, false)    
        # Breaks loop
        creating_potions = false
      end # Unless has to end here
      if recipe == ["", ""]
        puts "returning to menu...".light_black
        break 
      end
    end # 424 end
  
      # Ask player if they still want to search? If no then back to explore menu, if yes then continue in while loop.
      # potion_making_again_text
      # make_another = gets.chomp.downcase
  
      # # Loops back into making potions or returns to menu
      # potions_menu if make_another == "no"
      puts "type 'back' to return to potions menu...".blink
  
  end # Potions loop end 422
  ####################################################################################################
  
  # Text displayed to prompt search again
  def potion_making_again_text
    clear
    puts potions_art.light_magenta.blink
    puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Would you like to continue making potions?"
    line(1)
    puts "- yes".light_yellow
    line(0.5)
    puts "- no".light_red
    sleep(1)
    2.times { line }
   print "#{@player.name}> ".yellow
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
    @player.ingredients.each do |ingredient|
      puts "- #{ingredient}"
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
    @player.ingredients.each do |ingredient|
      puts "- #{ingredient}"
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
    puts @view.recipes_art.magenta
    line
    @player.recipes.each do |potion|
      puts "- #{potion}"
      sleep(0.15)
    end
    line
    puts "end".light_red
    line
    continue_prompt
  end




end