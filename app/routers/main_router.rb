require 'colorize'
require_relative 'potions_game/potions_router'
require_relative 'potions_game/potions_controller'
require_relative 'explore_game/explore_router'
require_relative 'explore_game/explore_controller'
require_relative 'billywig_game/billywig_router'
require_relative 'billywig_game/billywig_controller'
require_relative 'maze_game/maze_router'
require_relative 'maze_game/maze_controller'

class MainRouter
    def initialize(main_controller)
        @running = true
        @main_controller = main_controller
        @potions_router = PotionsRouter.new()
        @potions_controller = PotionsController.new
        @explore_router = ExploreRouter.new()
        @explore_controller = ExploreController.new()
        @billywig_router = BillywigRouter.new()
        @billywig_controller = BillywigController.new
        @maze_router = MazeRouter.new()
        @maze_controller = MazeController.new()
        @art_alkhemikal = "
    ░█████╗░██╗░░░░░██╗░░██╗██╗░░██╗███████╗███╗░░░███╗██╗██╗░░██╗░█████╗░██╗░░░░░
    ██╔══██╗██║░░░░░██║░██╔╝██║░░██║██╔════╝████╗░████║██║██║░██╔╝██╔══██╗██║░░░░░
    ███████║██║░░░░░█████═╝░███████║█████╗░░██╔████╔██║██║█████═╝░███████║██║░░░░░
    ██╔══██║██║░░░░░██╔═██╗░██╔══██║██╔══╝░░██║╚██╔╝██║██║██╔═██╗░██╔══██║██║░░░░░
    ██║░░██║███████╗██║░╚██╗██║░░██║███████╗██║░╚═╝░██║██║██║░╚██╗██║░░██║███████╗
    ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝"
    end

    def run
        puts "Demo version 2.0"
        @main_controller.line
    
        while @running
          main_menu_options
          action = gets.chomp.to_i
          @main_controller.clear
          route_action(action)
        end
      end
    
      private
    
      def route_action(action)
        case action
        # when 1 then @explore_router.run
        # when 2 then @potions_router.run
        when 3 then @billywig_router(@billywig_controller).run # Error here, expecting end ???
        # when 4 then @maz_router.run
        when 5 then stop
        else
          puts "Press 3 or 5".light_black
        end
      end
    
      def stop
        @running = false
      end
    
      def main_menu_options
        puts @art_alkhemikal.light_blue.blink
        @main_controller.line
        puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ?"
        @main_controller.line(1)
        puts "1 - 𝔼𝕩𝕡𝕝𝕠𝕣𝕖".light_yellow
        @main_controller.line(0.5)
        puts "2 - ℙ𝕠𝕥𝕚𝕠𝕟s".light_yellow
        @main_controller.line(0.5)
        puts "3 - 𝔹𝕚𝕝𝕝𝕪𝕎𝕚𝕘".light_yellow
        @main_controller.line(0.5)
        # puts "4 - Maze Runner".light_yellow
        # @main_controller.line(0.5)
        puts "5 - ℚ𝕦𝕚𝕥".light_red
        2.times { @main_controller.line(0.1) }
        print "#{WITCH_NAME}> ".yellow
      end














end