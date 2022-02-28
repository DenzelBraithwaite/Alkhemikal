require_relative 'basic_controller'
require_relative '../views/potion_making_view'

class PotionsController < BasicController
    def initialize
        @view = PotionMakingView.new
        @tutorial_completed = false
    end

    def run
        @running = true
        puts @view.title_art.yellow.blink
        line
        puts @view.intro_message if @tutorial_completed == false
        sleep(2)
        @tutorial_completed = true

        while @running
            clear
            @view.menu_options
            print "#{@witch_name}> ".magenta
            action = gets.chomp.to_i
            clear
            puts @view.title_art.light_magenta
            route_action(action)
        end
    end
    
    def route_action(action)
        case action
        when 1 then 
        when 2 then 
        when 3 then
        when 4 then @running = false
        else
            puts "Invalid option"
        end
    end
end