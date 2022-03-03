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
        puts "You can't go that way".light_red
    end

    def move_to_next_room
        "You move into the next room...".light_black.blink
    end

    def last_move(direction)
        "Last move: #{direction}."
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
