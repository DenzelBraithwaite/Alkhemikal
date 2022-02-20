# require 'colorize'

class ExploreView
    attr_reader :title_art

    def initialize
        @title_art = "
        ███████╗██╗░░██╗██████╗░██╗░░░░░░█████╗░██████╗░███████╗██╗
        ██╔════╝╚██╗██╔╝██╔══██╗██║░░░░░██╔══██╗██╔══██╗██╔════╝██║
        █████╗░░░╚███╔╝░██████╔╝██║░░░░░██║░░██║██████╔╝█████╗░░██║
        ██╔══╝░░░██╔██╗░██╔═══╝░██║░░░░░██║░░██║██╔══██╗██╔══╝░░╚═╝
        ███████╗██╔╝╚██╗██║░░░░░███████╗╚█████╔╝██║░░██║███████╗██╗
        ╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚══════╝░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝"
    end

    def explore_menu_options
        puts @title_art.light_green.blink
        puts ""
        puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ?"
        puts ""
        puts "1 - Search".light_yellow
        puts ""
        puts "2 - Ingredients".light_yellow
        puts ""
        puts "3 - Inventory".light_yellow
        puts ""
        puts "9 - ℚ𝕦𝕚𝕥".light_red
        puts ""
        puts ""
    end
   
    # Text displayed to prompt search again
    def search_again_text
        puts @title_art.light_green.blink
        puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Would you like to continue searching?"
        puts ""
        puts "1 - yes".light_yellow
        puts ""
        puts "9 - back".light_red
        sleep(1)
        puts ""
        puts ""
    end

      def invalid_option
        puts @title_art.light_green.blink
        puts ""
        puts "Please select a number from 1 to 4".light_black
        sleep(1.75)
      end
end