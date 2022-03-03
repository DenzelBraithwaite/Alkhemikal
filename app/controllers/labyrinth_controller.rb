require_relative 'basic_controller'
require_relative '../views/labyrinth_view'
require_relative '../repo/labyrinth_repo'

class LabyrinthController < BasicController
    def initialize(repo)
        @view = LabyrinthView.new
        @repo = repo
    end

    def run
        @running = true
        @last_movement = @last_movement || "none"
        @current_room = @current_room || @repo.rooms[9] # @repo.rooms.sample
        puts @view.title_art.yellow.blink
        line
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Welcome... to the Wiccan Labyrinth!", 0.010, false)
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} This will test the will and endurance of even the most wicked of witches.", 0.010, false)
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} The rules are simply dea girl so listen close, I WON'T be repeating myself!", 0.010, false)
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Your goal is to wander the labyrinth, in search of rare ingredients.", 0.010, false)
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Only problem is of course, you're not alone in there.", 0.010, false)
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Be careful and don't forget, when you think you've had enough, call my name three times.", 0.010, false)
        slow_dialogue("#{"Tip:".light_white} Press '9' at any time to return to the main menu. When you play again you'll start from the same room.".light_black, 0.010, true)

        while @running
            clear
            room = define_walls + define_floors
            @view.labyrinth_menu_options
            puts "Current room: #{room}".light_black
            line
            puts @view.last_move(@last_movement).light_yellow
            line
            print "#{@player.name}#{'> '.yellow}"
            action = gets.chomp.downcase
            clear
            puts @view.title_art.yellow
            route_action(action)
        end
    end
    
    def route_action(action)
        case action
        when "up" then move_up?
        when "down" then move_down?
        when "left" then move_left?
        when "right" then move_right?
        when "9" then @running = false
        when "room" then puts "row:#{@current_room.row_id.to_s.cyan}\ncol:#{(@current_room.column_id.to_s).blue}"; sleep(1)
        else
            puts "Invalid option"
        end
    end

    # Checks if up is valid, if true then change current room to the room up above.
    def move_up?
        if @current_room.up
            move_up
            puts @view.move_to_next_room
            @last_movement = "up"
        else
            @view.display_no_room
        end
        sleep(0.75)
    end
    
    
    def move_up
        @current_room = @repo.find_room(@current_room.row_id - 1, @current_room.column_id)
    end
    
    # Checks if down is valid, if false then change current room to the room down below.
    def move_down?
        if @current_room.down
            move_down
            puts @view.move_to_next_room
            @last_movement = "down"
        else
            @view.display_no_room
        end
        sleep(0.75)
    end
    
    def move_down
        @current_room = @repo.find_room(@current_room.row_id + 1, @current_room.column_id)
    end
    
    # Checks if left is valid, if false then change current room to the room on the left.
    def move_left?
        if @current_room.left
            move_left
            puts @view.move_to_next_room
            @last_movement = "left"
        else
            @view.display_no_room
        end
        sleep(0.75)
    end
    
    def move_left
        @current_room = @repo.find_room(@current_room.row_id, @current_room.column_id - 1)
    end
    
    # Checks if right is valid, if true then change current room to the room on the right.
    def move_right?
        if @current_room.right
            move_right
            puts @view.move_to_next_room
            @last_movement = "right"
        else
            @view.display_no_room
        end
        sleep(0.75)
    end
    
    def move_right
        @current_room = @repo.find_room(@current_room.row_id, @current_room.column_id + 1)
    end
    
    # Determine if room matches a specific room, to acquire something
    # def special_room
    #     "you are special!" if @current_room.row_id == @repo.rooms.first.row_id &&
    #     @current_room.column_id == @repo.rooms.first.column_id
    # end
    
    def define_walls
        case @current_room.column_id
        when 1 
            "You're surrounded by a forest of trees, "
        when 11
            "You're surrounded by a forest of trees, "
        when 2
            "Giant mushrooms tower around you, "
        when 12
            "Giant mushrooms tower around you, "
        when 3
            "It's cold, walls of ice are all around you, "
        when 13
            "It's cold, walls of ice are all around you, "
        when 4
            "It's dry, the walls around you are rough and rocky, "
        when 14
            "It's dry, the walls around you are rough and rocky, "
        when 5
            "It's humid, there are many long and thick vines surrounding you, "
        when 15
            "It's humid, there are many long and thick vines surrounding you, "
        when 6
            "Tall bamboo in every direction you look, "
        when 16
            "Tall bamboo in every direction you look, "
        when 7
            "You can't see a thing, the fog is too thick, "
        when 17
            "You can't see a thing, the fog is too thick, "
        when 8
            "You're surrounded by yourself, all around you are mirrors, "
        when 18
            "You're surrounded by yourself, all around you are mirrors, "
        when 9
            "You're burning up, everything is on fire, "
        when 19
            "You're burning up, everything is on fire, "
        when 10
            "The walls around you are made of brick it seems, "
        when 20
            "The walls around you are made of brick it seems, "
        end
        
    end

    def define_floors
        case @current_room.row_id
        when 1
            "there's grass beneath your feet."
        when 2
            "the ground is a musky swamp covered in mildew."
        when 3
            "the ground is frozen and slippery."
        when 4
            "the grass beneath your feet is up to your waist."
        when 5
            "there's a cobblestone path guiding you."
        when 6
            "you hear crunching and crinkling with each step, enjoying the foliage."
        when 7
            "the ground is riddled with shallow puddles."
        when 8
            "the floor is transparent and fragile... must be glass."
        when 9
            "your feet burn with each step on this scorching hot metal."
        when 10
            "the ground is made of cement, sturdy and reliable."
        when 11
            "there's grass beneath your feet."
        when 12
            "the ground is a musky swamp covered in mildew."
        when 13
            "the ground is frozen and slippery."
        when 14
            "the grass beneath your feet is up to your waist."
        when 15
            "there's a cobblestone path guiding you."
        when 16
            "you hear crunching and crinkling with each step, enjoying the foliage."
        when 17
            "the ground is riddled with shallow puddles."
        when 18
            "the floor is transparent and fragile... must be glass."
        when 19
            "your feet burn with each step on this scorching hot metal."
        when 20
            "the ground is made of cement, sturdy and reliable."
        end
    end
end