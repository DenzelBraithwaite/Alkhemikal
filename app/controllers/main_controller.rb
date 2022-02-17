require 'colorize'
require_relative 'witch_model'
require_relative 'main_view'

class MainController


  def initialize(repo)
    @repo = repo

  end




  private

  # Get user input lower case
  def input
    gets.chomp.downcase
  end

  # Get user input as integer
  def input_integer
    gets.chomp.to_i
  end

  # Line plus optional timer
  def line(time = 0)
    puts ""
    sleep(time.to_f)
  end

  # Clear screen
  def clear
      if Gem.win_platform?
        system 'cls'
      else
        system 'clear'
      end
  end

  def continue_prompt
    puts "𝖯𝗋𝖾𝗌𝗌 𝖾𝗇𝗍𝖾𝗋 𝗍𝗈 𝖼𝗈𝗇𝗍𝗂𝗇𝗎𝖾".light_black.blink
      input
  end


end



def gruntilda_says(text)
  print "Gruntilda> ".yellow
  slow_dialogue(text, 0.015, false)
end

def slow_dialogue(text, delay = 0.030, continue = true)
  slow_text = text.chars

  slow_text.each do |char|
    if char == "," || char == "." || char == "!"
      print char
      sleep(0.45)
    else
      print char
      sleep(delay)
    end
  end
  
  2.times {line(0.5)}
  if continue == true
    continue_prompt
  end
end

#====================================================================#
#-----------------------------Main menu------------------------------#
#====================================================================#

def main_menu
  in_menu = true
  while in_menu == true
    main_menu_text
    choice = input
    main_menu_options(choice)
    in_menu = false if choice == "quit"
  end
  puts "Closing game..."
end

# Clears screen, displays menu options.
def main_menu_text
  clear 
  puts potion_master_art.light_blue.blink
  line
  puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ?"
  line(1)
  puts "- 𝔼𝕩𝕡𝕝𝕠𝕣𝕖".light_yellow
  line(0.5)
  puts "- ℙ𝕠𝕥𝕚𝕠𝕟s".light_yellow
  line(0.5)
  puts "- 𝔹𝕚𝕝𝕝𝕪𝕎𝕚𝕘".light_yellow
  line(0.5)
  puts "- ℚ𝕦𝕚𝕥".light_red
  sleep(0.25)
  2.times { line }
  print "#{WITCH_NAME}> ".yellow
end

# 1. Search for ingredients, 2. Make potions, 3. Play Billywig, 4.Quit game 
def main_menu_options(choice)
  options = ["explore", "potions", "billywig", "quit"]

  # This will continue to other menus or quit the game depending on player's option
  case choice 
  when "explore"
    explore_menu
  when "potions"
    potions_menu
  when "billywig"
    billywig  
  
  when "quit"
    quit
  end
end

# Closes game and saves
def quit
  # Save game file --> CSV

  # Saving game dialogue
  puts "Now saving file"
  sleep(1)

  # Goodbye message
  puts "Now quitting..."
  sleep(1)
  slow_dialogue("Thank you for playing...", delay = 0.050, continue = false)
  sleep(1.5)
  clear
end

#====================================================================#
#----------------------------Explore menu----------------------------#
#====================================================================#

# - Ingredient searching loop option, 1. Explore, 2. Check unlocked ingredients, 3. main menu



# - Potion making loop option, 1. Check unlocked ingredients, 2. Check unlocked potions, 3. Make new potion, 4. main menu

def explore_menu
  clear
  # loading Add back after testing <-------------------------------------
  in_menu = true
  while in_menu == true
    explore_menu_text
    choice = input
    explore_menu_options(choice)
    in_menu = false if choice == "back"
  end
end

# Clears screen, displays menu options.
def explore_menu_text
  clear 
  puts explore_art.light_green.blink
  line
  puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ?"
  line(1)
  puts "- Search".light_yellow
  line(0.5)
  puts "- Ingredients".light_yellow
  line(0.5)
  # WHen I add random clothings you can find, this will show what clothes are available to use. Purely cosmetic
  puts "- Inventory(In_Progress)".light_yellow
  line(0.5)
  puts "- Back".light_red
  sleep(0.25)
  2.times { line }
  print "#{WITCH_NAME}> ".yellow
end

# 1. Search for ingredients, 2. Check unlocked ingredients, 3. Check inventory of clothes, 4.Back to menu 
def explore_menu_options(choice)
  options = ["search", "ingredients", "inventory", "back"]

  # This will continue to other menus or quit the game depending on player's option
  case choice 
  when "search"
    # Searching method here
    searching
  when "ingredients"
    # Display unlocked ingredients here
    view_unlocked_ingredients_green

  when "inventory"
    # View clothing found
    puts "Checking unlocked clothes method here"

  when "back"
    # Back to main menu
    puts "Heading back...".light_black
  end
end

#-----------------------------Searching-------------------------------#

def searching
  exploring = true
  while exploring == true
    searching_loop
    choice = input
    exploring = false if choice == "no" || choice == "n"
  end
end

def searching_loop
  stop_searching = false
  while stop_searching == false
    # Time it takes to search
    searching_time = rand(1..60)

    # Put message saying searching while walking
    slow_dialogue("Now Searching", delay = 0.015, false)

    # Add random delay between each item found.
    searching_time.times do
      print ".".light_yellow
      sleep(0.050)
      print ".".yellow
      sleep(0.050)
    end
    sleep(1.25)
    
    # Find random ingredient
    if ALL_INGREDIENTS.empty?
      slow_dialogue("Well that seems to be the last of them, ", delay = 0.015, false)
      slow_dialogue("guess we'd better start makin' some potions.", delay = 0.015, true)
      stop_searching = true
    else
      
      ingredient_found = ALL_INGREDIENTS.sample
      ALL_INGREDIENTS.delete("#{ingredient_found}")

      # When item is found, display dialogue about the item
      puts "You found #{ingredient_found}!" # Add ingredient descriptions after
      sleep(1.5)

      # Checks to see if it's a good or bad item.
      if GOOD_INGREDIENTS.include?(ingredient_found)
        puts "Gʀᴜɴᴛɪʟᴅᴀ> #{GOOD_INGREDIENT_TEXT.sample}"
        UNLOCKED_INGREDIENTS << ingredient_found unless UNLOCKED_INGREDIENTS.include?(ingredient_found)
      else
        puts "Gʀᴜɴᴛɪʟᴅᴀ> #{BAD_INGREDIENT_TEXT.sample}"
      end
      line(1)
      continue_prompt

    end
      # Break loop
      stop_searching = true

      # Ask player if they still want to search? If no then back to explore menu, if yes then continue in while loop.
      search_again_text
  end
end

# Text displayed to prompt search again
def search_again_text
  clear
  puts explore_art.light_green.blink
  puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Would you like to continue searching?"
  line(1)
  puts "- yes".light_yellow
  line(0.5)
  puts "- no".light_red
  sleep(1)
  2.times { line }
 print "#{WITCH_NAME}> ".yellow
end

#====================================================================#
#----------------------------Potions menu----------------------------#
#====================================================================#

def potions_menu
  clear
  # loading Add back after testing <-------------------------------------
  in_menu = true
  while in_menu == true
    potions_menu_text
    choice = input
    potions_menu_options(choice)
    in_menu = false if choice == "back"
  end
end


# Clears screen, displays menu options.
def potions_menu_text
  clear 
  puts potions_art.light_magenta.blink
  line
  puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ?"
  line(1)
  puts "- Potion making".light_yellow
  line(0.5)
  puts "- Ingredients".light_yellow
  line(0.5)
  puts "- Recipes".light_yellow
  line(0.5)
  puts "- Back".light_red
  sleep(0.25)
  2.times { line }
  print "#{WITCH_NAME}> ".yellow
end

# 1. Search for ingredients, 2. Check unlocked ingredients, 3. Check inventory of clothes, 4.Back to menu 
def potions_menu_options(choice)
  options = ["potion making", "ingredients", "recipes", "back"]

  # This will continue to other menus or go back to the main menu depending on player's option
  case choice 
  when "potion making"
    # potions_making
    potion_making_menu

  when "ingredients"
    # Display unlocked ingredients here
    view_unlocked_ingredients_magenta

  when "recipes"
    # View unlocked potions
    view_recipes

  when "back"
    # return "back"
  end
end

#-----------------------------potion making-------------------------------#
# Optional tutorial, shows you how to make the first potion

def potion_making_menu
  making_potions = true
  if UNLOCKED_POTIONS.empty?
    line(1)
    gruntilda_says("Want to hear the tutorial?")
    print "#{WITCH_NAME}> ".yellow
    run_tutorial = input
    if run_tutorial == "yes" || run_tutorial == "y"
      potion_making_tutorial
    else
      clear
    end
  end
  while making_potions == true
    potions_loop
    choice = input
    making_potions = false if choice == "no" || choice == "back"
  end
end

def potion_making_tutorial
  slow_dialogue(INTRO_TUTORIAL_MESSAGE, 0.01, true)
  slow_dialogue(FIRST_TUTORIAL_MESSAGE, 0.01, true)
  slow_dialogue(":Brew of Beginnings => [water, small bones]", 0.025, true).light_black
  clear
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
      puts potion_making_art.light_magenta.blink
      if UNLOCKED_INGREDIENTS.length < 2
        quick_view_unlocked_ingredients
        5.times {line}
        puts "You need at least 2 ingredients to make potions".light_red
        continue_prompt
        break
      end

      quick_view_unlocked_ingredients

      # Add first ingredient
      puts "First ingredient?".light_cyan
      first_ingredient = input
            
      until UNLOCKED_INGREDIENTS.include?(first_ingredient)
        puts "You need to add ingredients you actually own...".light_black
        sleep(1.25)
        clear
        puts potion_making_art.light_magenta.blink
        quick_view_unlocked_ingredients
        puts "First ingredient?".light_cyan
        first_ingredient = input
      end
      puts "#{first_ingredient} added to the pot...".light_black
      line(0.75)

      # Add second ingredient
      puts "second ingredient?".light_cyan
      second_ingredient = input
      
      until UNLOCKED_INGREDIENTS.include?(second_ingredient)
        puts "You need to add ingredients you actually own...".light_black
        sleep(1.25)
        clear
        puts potion_making_art.light_magenta.blink
        quick_view_unlocked_ingredients
        puts "#{first_ingredient} added to the pot...".light_black
        line
        puts "second ingredient?".light_cyan
        second_ingredient = input
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
      if ALL_POTIONS.all? do |potion|
          UNLOCKED_POTIONS.key?(potion)
        end
        puts "Gruntilda> Hot Billywig! You've mastered all the potions!! Feel welcome to use the cauldron as much as you want" 
      end

      # Loops through all potions to see if you matched a recipe
      no_matches = true
      ALL_POTIONS.each do |potion, ingredients|
        if ingredients.include?(recipe[0]) && ingredients.include?(recipe[1])
          # Display text after creating the potion
          puts "You've created the #{potion}!" # Add ingredient descriptions after
          sleep(1.5)

          # Check if potion exists in unlocked_potions, don't add it if it does.
          if UNLOCKED_POTIONS.key?(potion)
            puts "You've already created this"
            no_matches = false
            continue_prompt
          else
            puts GOOD_POTION_TEXT.sample
            puts "Congrats, a new potion!"
            UNLOCKED_POTIONS[potion] = ingredients
            recipe.each { |ingredient| UNLOCKED_INGREDIENTS.delete(ingredient) }
            no_matches = false
            continue_prompt
          end
        end
      end # Ends line 508

      if no_matches == true
        line
        puts BAD_POTION_TEXT.sample
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
    # make_another = input

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
 print "#{WITCH_NAME}> ".yellow
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
  UNLOCKED_INGREDIENTS.each do |ingredient|
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
  UNLOCKED_INGREDIENTS.each do |ingredient|
    puts "- #{ingredient}"
    sleep(0.15)
  end
  line
  puts "end".light_red
  line
  continue_prompt
end

def quick_view_unlocked_ingredients
  puts "Ingredients:".light_yellow
  line(0.5)
  UNLOCKED_INGREDIENTS.each do |ingredient|
    puts "- #{ingredient}"
    sleep(0.10)
  end
  line
  puts "end".light_red
  line
end

def view_recipes
  slow_dialogue("Checking recipes...", 0.02, false)
  sleep(0.5)
  clear
  puts recipes_art.magenta
  line
  UNLOCKED_POTIONS.each do |potion|
    puts "- #{potion}"
    sleep(0.15)
  end
  line
  puts "end".light_red
  line
  continue_prompt
end

#====================================================================#
#-------------------------Loading screens----------------------------#
#====================================================================#

# Regular 0 - 100 loading screen.
def loading
  print "Loading"
  100.times do
    print "."
    sleep(0.03)
  end
  print "100%!".green
  sleep(1.5)
  clear
end

#Longer loading screen with optional delay
def long_loading(pause = 4)
  print "Loading"
  40.times do
    print "."
    sleep(0.05)
  end
  sleep(pause.to_f)
  60.times do
    print "."
    sleep(0.02)
  end
  print "100%!".green
  sleep(1.5)
  clear
end

#First loading screen when running file
def first_loading_screen
   long_loading
   4.times do
      puts potion_master_art.light_blue
      sleep(0.1)
      system("clear")
   end

   6.times do
      puts potion_master_art.light_blue
      puts witch_art.magenta
      sleep(0.1)
      clear
   end

   puts potion_master_art.light_blue
   puts witch_art.magenta.blink
   sleep(2)
   print "For Elisa, "
   sleep(1.5)
   print "happy birthday"
   3.times do
      sleep(0.5)
      print "!".magenta.blink
   end
      line(3.5)
      clear
end

#Make loading screen where it displays different messages, like "mixing potions, cleaning broom"




#====================================================================#

# Decide later if I should clear screen at the end

#For demos
def demo_over
puts "#{"Kaz >".red} Demo over :), thanks for playing stinky butt face".on_white.blink
line(0.3)
puts "#{"Kaz >".blue} Demo over :), thanks for playing stinky butt face".blink
line(0.3)
puts "#{"Kaz >".green} Demo over :), thanks for playing stinky butt face".on_light_magenta.blink
line(0.3)
puts "#{"Kaz >".yellow} Demo over :), thanks for playing stinky butt face".blink
line(0.3)
puts "#{"Kaz >".magenta} Demo over :), thanks for playing stinky butt face".on_light_green.blink
line(0.3)
puts "#{"Kaz >".cyan} Demo over :), thanks for playing stinky butt face".blink
line(0.3)
sleep(3)
end


#====================================================================#
#-------------------------------Tools--------------------------------#
#====================================================================#


#====================================================================#
#-----------------------------Dialogue-------------------------------#
#====================================================================#
