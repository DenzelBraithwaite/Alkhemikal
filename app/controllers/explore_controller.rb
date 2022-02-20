require_relative '../repo/explore_repo'

class ExploreController
    def initialize(explore_repo)
        @explore_repo = explore_repo
        @running = true
    end
end


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
  