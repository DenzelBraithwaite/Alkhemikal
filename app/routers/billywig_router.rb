require 'colorize'

class BillywigRouter
    def initialize(controller)
        @running = true
        @controller = controller
        @art_billywig = "
    ██████╗░██╗██╗░░░░░██╗░░░░░██╗░░░██╗░██╗░░░░░░░██╗██╗░██████╗░██╗
    ██╔══██╗██║██║░░░░░██║░░░░░╚██╗░██╔╝░██║░░██╗░░██║██║██╔════╝░██║
    ██████╦╝██║██║░░░░░██║░░░░░░╚████╔╝░░╚██╗████╗██╔╝██║██║░░██╗░██║
    ██╔══██╗██║██║░░░░░██║░░░░░░░╚██╔╝░░░░████╔═████║░██║██║░░╚██╗╚═╝
    ██████╦╝██║███████╗███████╗░░░██║░░░░░╚██╔╝░╚██╔╝░██║╚██████╔╝██╗
    ╚═════╝░╚═╝╚══════╝╚══════╝░░░╚═╝░░░░░░╚═╝░░░╚═╝░░╚═╝░╚═════╝░╚═╝"
    end

    def run
        while @running
          main_menu_options
          action = gets.chomp.to_i
          @controller.clear
          route_action(action)
        end
      end
    
      private
    
      def route_action(action)
        case action
        when 1 then @controller.play
        when 2 then stop
        else
          puts "Press 1 or 2".light_black
        end
      end
    
      def stop
        @running = false
      end
    
      def main_menu_options
        puts @art_billywig.light_blue.blink
        @controller.line
        puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ?"
        @controller.line(1)
        puts "1 - Play some Billywig".light_yellow
        @controller.line(0.5)
        puts "2 - Back to main menu".light_red
        2.times { @controller.line(0.1) }
        print "#{WITCH_NAME}> ".yellow
      end














end