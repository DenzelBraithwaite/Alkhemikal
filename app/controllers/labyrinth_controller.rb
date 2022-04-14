require_relative '../views/labyrinth_view'
require_relative '../repo/labyrinth_repo'

class LabyrinthController < ParentController
  def initialize(repo)
    super(player)
    @view = LabyrinthView.new
    @repo = repo
    @new_hat_index = 0
    @new_robe_index = 0
    # Rooms with something to be found
    @room_indexes = [
      15, 55, 95, 125, 155, 175, 205, 245, 285, 335, 365, # Odd numbers
      30, 60, 90, 120, 150, 190, 210, 240, 290, 350, 380 # Even numbers
    ]
    # Hats that can be found when exploring
    @all_hats = [
      'pointy hat',
      'magic hood',
      'long grey wig',
      "witch's hat",
      'sorting hat',
      'short purple wig',
      'sacred crown',
      "magician's hay",
      'plague doctor mask',
      'invisible coif',
      'black bonnet'
    ]
    # Robes that can be found when exploring
    @all_robes = [
      'peasant robe',
      "wizard's robe",
      'Beautifying robe',
      'dark cloak',
      "witch's robe",
      'Quidditch uniform',
      'Wings of freedom cloak',
      'magic cape',
      'blue kirtle',
      'litte red riding hood',
      'ash grey capelet'
    ]
  end

  def run
    @running = true
    @last_movement = @last_movement || "none"
    @current_room = @current_room || @repo.rooms[0] # @repo.rooms[rand(1..200)]
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
      @room_description = "#{define_walls} #{define_floors}"
      @view.press_9_to_quit
      @view.labyrinth_menu_options
      puts "#{'Cᴜʀʀᴇɴᴛ ʀᴏᴏᴍ:'.yellow} #{@room_description}"
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
  def add_clothing_to_inventory(clothing, odd = true)
    if odd
      new_item_alert("HAT", clothing)
      @player.unlocked_hats << clothing
      @new_hat_index += 1
    else
      new_item_alert("ROBE", clothing)
      @player.unlocked_robes << clothing
      @new_robe_index += 1
    end
  end

  # A list of all rooms with hidden clothing, if entered, it will be added to your inventory.
  def check_if_room_is_special
    room_index = @repo.find_room_index(@current_room.row_id, @current_room.column_id)
    return unless @room_indexes.include?(room_index)

    @room_indexes.delete(room_index)
    if room_index.odd?
      add_clothing_to_inventory(@all_hats[@new_hat_index])
    else
      add_clothing_to_inventory(@all_robes[@new_robe_index], false)
    end
  end

  # Alerts player when a new clothing is found
  def new_item_alert(hat_or_robe, item_name)
    clear
    2.times do
      fill_screen("                                                               Nᴇᴡ #{hat_or_robe}!                                                                                                                                                           ".black.on_yellow, 0.5)
      fill_screen("                                                               Nᴇᴡ #{hat_or_robe}!                                                                                                                                                   ".black.on_light_yellow, 0.5)
    end
    clear
    @view.press_9_to_quit
    @view.labyrinth_menu_options
    puts "#{'Cᴜʀʀᴇɴᴛ ʀᴏᴏᴍ:'.yellow} #{@room_description}"
    line
    puts @view.last_move(@last_movement)
    line
    slow_dialogue("You've unlocked: #{item_name.yellow}".blink, 0.04, false)
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
      "You're surrounded by darkness and glaring eyes, "
    when 2
      'Giant mushrooms tower around you, '
    when 12
      'The air is humid, palm trees are in every direction, '
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
      'Tall bamboo in every direction you look, '
    when 16
      'Tall bamboo in every direction you look, '
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
      'The walls around you are made of brick it seems, '
    when 20
      'The walls around you are made of brick it seems, '
    end
  end

  # Cyclomatic complexity too high, change case statement to if elsif.
  def define_floors
    # Dark area // Volcano area
      if @current_room.row_id.between?(1..5) && @current_room.column_id.between?(1, 5)
        'you are in the dark, '
      elsif @current_room.row_id.between?(1..5) && @current_room.column_id.between?(16, 20)
        "you're at the volcano, "
      end

    # Desert area
      if @current_room.row_id.between?(6..10) && @current_room.column_id.between?(1, 5)
        if (@current_room.row_id.between?(9, 10) && @current_room.column_id.between?(9, 10))
          'You are at the center of the maze, '
        else
          "You're in the desert, "
        end
      end

    # Outer volcano mountain area
    when (1..10)
      if @current_room.column_id.between?(11, 15)
        if @current_room.row_id.between?(6, 10) && @current_room.column_id.between?(11, 20) ||
           @current_room.row_id.between?(9, 10) && @current_room.column_id == 11
          'You are at the center of the maze, '
        else
          'You are on a dry mountain, '
        end
      end

    # Jungle area / Frozen area
    when (16..20)
      if @current_room.column_id.between?(16, 20)
        'You are in a swamp, '
      elsif @current_room.column_id.between?(1, 5)
        'You are in a frozen wasteland, '
      end

    # Forest area
    when (11..20)
      if @current_room.column_id.between?(11, 15)
        if @current_room.row_id.between?(11, 15) && @current_room.column_id.between?(11, 20) ||
           @current_room.row_id == 11 && @current_room.column_id == 11
          'You are at the center of the maze, '
        else
          "You're in a forest, "
        end
      end

    # Wet area
    when (11..15)
      if @current_room.column_id.between?(1, 10)
        if @current_room.row_id.between?(11, 20) && @current_room.column_id.between?(6, 10) ||
           @current_room.row_id == 11 && @current_room.column_id.between?(9, 10)
          'You are at the center of the maze, '
        else
          'You are the cold wetlands, '
        end
      end
    end
  end
end
