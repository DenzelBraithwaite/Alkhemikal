require_relative '../repo/explore_repo'
require_relative '../views/explore_view'

class ExploreController < BasicController
    def initialize(explore_repo)
        @explore_repo = explore_repo
        @running = true
        @view = ExploreView.new
    end

    def run
        while @running
            @view.explore_menu_options
            print "#{@witch_name}> ".yellow
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
            puts "TODO: Explore for ingredients"
        when 2
            fast_loading
        puts "TODO: View unlocked ingredients"
        when 3
            fast_loading
            puts "TODO: Check inventory, change clothes maybe"
        when 9 then stop
        else
            @view.invalid_option
            clear
        end
    end
  
    def stop
        @running = false
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
            print "#{@witch_name}> ".yellow # Not grabbing name?
            action = gets.chomp.to_i
            searching = false if action == 9
        end
    end
    
    def found_ingredient
        # Find random ingredient
        if @explore_repo.all_ingredients.empty?
        slow_dialogue("Well that seems to be the last of them, ", delay = 0.015, false)
        slow_dialogue("guess we'd better start makin' some potions.", delay = 0.015, true)
        else
        ingredient_found = @explore_repo.all_ingredients.sample
        @explore_repo.all_ingredients.delete(ingredient_found)
    
        # When item is found, display dialogue about the item
        puts "You found #{ingredient_found}!"
        sleep(1.5)
    
        # Checks to see if it's a good or bad item.
        if @explore_repo.good_ingredients.include?(ingredient_found)
            puts "Gʀᴜɴᴛɪʟᴅᴀ> #{@explore_repo.good_ingredient_text.sample}"
            @explore_repo.unlocked_ingredients << ingredient_found unless @explore_repo.unlocked_ingredients.include?(ingredient_found)
        else
            puts "Gʀᴜɴᴛɪʟᴅᴀ> #{@explore_repo.bad_ingredient_text.sample}"
        end
        line(1)
        continue_prompt
        end
    end

    def searching_loop
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
    end
end

 