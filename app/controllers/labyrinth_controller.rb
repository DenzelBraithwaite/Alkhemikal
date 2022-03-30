require_relative '../views/labyrinth_view'
require_relative '../repo/labyrinth_repo'

class LabyrinthController < ParentController
  def initialize(repo)
    super(player)
    @view = LabyrinthView.new
    @repo = repo
  end

  def run
    @running = true
    @last_movement = @last_movement || "none"
    @current_room = @current_room || @repo.rooms.last #@repo.rooms[rand(1..200)]
    puts @view.title_art.yellow.blink
    line
    # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Welcome... to the Wiccan Labyrinth!", 0.010, false)
    # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} This will test the will and endurance of even the most wicked of witches.", 0.010, false)
    # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} The rules are simply dea girl so listen close, I WON'T be repeating myself!", 0.010, false)
    # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Your goal is to wander the labyrinth, in search of rare ingredients.", 0.010, false)
    # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Only problem is of course, you're not alone in there.", 0.010, false)
    # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Be careful and don't forget, when you think you've had enough, call my name three times.", 0.010, false)

    while @running
      clear
      room = define_walls + define_floors
      @view.press_9_to_quit
      @view.labyrinth_menu_options
      puts "#{'Cᴜʀʀᴇɴᴛ ʀᴏᴏᴍ:'.yellow} #{room}"
      line
      puts @view.last_move(@last_movement)
      line
      check_if_room_is_special
      print "#{@player.name}#{'> '.yellow}"
      action = gets.chomp.downcase
      clear
      @view.press_9_to_quit
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

  # Determine if room matches a specific room, to acquire something
  def special_room(clothing, room)
    return if @player.unlocked_robes.include?(clothing)
    @player.unlocked_robes << clothing if @current_room == @repo.rooms[room]
  end

  # A list of all rooms with hidden clothing, if entered, it will be added to your inventory.
  def check_if_room_is_special
    # Make sure it can't add the same item twice, currently you can. Also add a message or something when you get the clothing
    room_numbers = [1, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220,
                    240, 260, 280, 300, 320, 340, 360, 398, 399
    ]
    special_room("test1", room_numbers[0])
    special_room("test2", room_numbers[1])
    special_room("test3", room_numbers[2])
    special_room("test4", room_numbers[3])
    special_room("test5", room_numbers[4])
    special_room("test6", room_numbers[5])
    special_room("test7", room_numbers[6])
    special_room("test8", room_numbers[7])
    special_room("test9", room_numbers[8])
    special_room("test10", room_numbers[9])
    special_room("test11", room_numbers[10])
    special_room("test12", room_numbers[11])
    special_room("test13", room_numbers[12])
    special_room("test14", room_numbers[13])
    special_room("test15", room_numbers[14])
    special_room("test16", room_numbers[15])
    special_room("test17", room_numbers[16])
    special_room("test18", room_numbers[17])
    special_room("test19", room_numbers[18])
    special_room("test20", room_numbers[19])
    special_room("test21", room_numbers[20])
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
