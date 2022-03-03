require 'colorize'

class LabyrinthView < MainView
    def initialize
        @title_art = "
        ░██╗░░░░░░░██╗██╗░█████╗░░█████╗░░█████╗░███╗░░██╗
        ░██║░░██╗░░██║██║██╔══██╗██╔══██╗██╔══██╗████╗░██║
        ░╚██╗████╗██╔╝██║██║░░╚═╝██║░░╚═╝███████║██╔██╗██║
        ░░████╔═████║░██║██║░░██╗██║░░██╗██╔══██║██║╚████║
        ░░╚██╔╝░╚██╔╝░██║╚█████╔╝╚█████╔╝██║░░██║██║░╚███║
        ░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝
        
        ██╗░░░░░░█████╗░██████╗░██╗░░░██╗██████╗░██╗███╗░░██╗████████╗██╗░░██╗
        ██║░░░░░██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗██║████╗░██║╚══██╔══╝██║░░██║
        ██║░░░░░███████║██████╦╝░╚████╔╝░██████╔╝██║██╔██╗██║░░░██║░░░███████║
        ██║░░░░░██╔══██║██╔══██╗░░╚██╔╝░░██╔══██╗██║██║╚████║░░░██║░░░██╔══██║
        ███████╗██║░░██║██████╦╝░░░██║░░░██║░░██║██║██║░╚███║░░░██║░░░██║░░██║
        ╚══════╝╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝"
    end

    def display_no_room
        puts "Yᴏᴜ ᴄᴀɴ'ᴛ ɢᴏ ᴛʜᴀᴛ ᴡᴀʏ".light_red
    end

    def move_to_next_room
        "Yᴏᴜ ᴍᴏᴠᴇ ɪɴᴛᴏ ᴛʜᴇ ɴᴇxᴛ ʀᴏᴏᴍ...".light_black.blink
    end

    def last_move(direction)
        "#{'Lᴀsᴛ ᴍᴏᴠᴇ:'.light_black} #{direction.yellow}."
    end

    def press_9_to_quit
        nine = " 9 ".light_red
        print "Tɪᴘ: ".yellow
        print "Pʀᴇss".light_black
        print nine
        puts "ᴀᴛ ᴀɴʏ ᴛɪᴍᴇ ᴛᴏ ʀᴇᴛᴜʀɴ ᴛᴏ ᴛʜᴇ ᴍᴀɪɴ ᴍᴇɴᴜ. Wʜᴇɴ ʏᴏᴜ ᴘʟᴀʏ ᴀɢᴀɪɴ ʏᴏᴜ'ʟʟ sᴛᴀʀᴛ ғʀᴏᴍ ᴛʜᴇ sᴀᴍᴇ ʀᴏᴏᴍ.".light_black
    end

    def labyrinth_menu_options
        puts @title_art.yellow
        puts ""
        puts "Pick a #{'direction'.yellow}."
        puts ""
        sleep(0.02)
        puts " #{'-'.yellow} Up"
        puts ""
        sleep(0.02)
        puts " #{'-'.yellow} Down"
        puts ""
        sleep(0.02)
        puts " #{'-'.yellow} Left"
        puts ""
        sleep(0.02)
        puts " #{'-'.yellow} Right"
        puts ""
        sleep(0.02)
    end
end
