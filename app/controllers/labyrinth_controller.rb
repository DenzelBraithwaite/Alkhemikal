require_relative '../views/labyrinth_view'
require_relative '../repo/labyrinth_repo'

# Add Billywig controller and hide it in a room
class LabyrinthController < ParentController
  def initialize(repo)
    super(player)
    @view = LabyrinthView.new
    @repo = repo
    @new_hat_index = 0
    @new_robe_index = 0
  end

  # Labyrinth game main menu
  def menu
    @in_menu = true
    while @in_menu
      @view.labyrinth_main_menu
      print "#{@player.name}#{'> '.yellow}"
      menu_action = gets.chomp.to_i
      clear
      menu_route_action(menu_action)
      clear
    end
  end

  # Let's player decide to play or run the tutorial
  def menu_route_action(menu_action)
    case menu_action
    when 1 then run
    when 2 then tutorial
    when 9 then @in_menu = false
    else
      puts 'Invalid option'
    end
  end

  # Displays dialogue on how to play Billywig
  def tutorial
    clear
    puts @view.title_art.yellow.blink
    puts ''
    slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} #{@view.tutorial}", 0.010, true)
  end

  def run
    @running = true
    @last_movement = @last_movement || "none"
    @current_room = @current_room || @repo.rooms[rand(100..279)]

    while @running
      clear
      @view.press_9_to_quit
      @view.labyrinth_menu_options(@current_room.role, @last_movement)
      puts "#{'Cᴜʀʀᴇɴᴛ ʀᴏᴏᴍ:'.yellow} #{define_room}"
      puts @view.room_visited?(@current_room)
      puts ''
      # Cheks if room has an item
      check_if_room_is_special
      # Checks if room is freezing or burning, sets a timer
      normal_or_timer_room
    end
  end

  # Menu that will always be present while navigating maze
  def route_action(action)
    case action
    when "up" then move_up?
    when "u" then move_up?
    when "down" then move_down?
    when "d" then move_down?
    when "left" then move_left?
    when "l" then move_left?
    when "right" then move_right?
    when "r" then move_right?
    when "9" then @running = false
    when "info" then room_info
    else
      puts 'Invalid option'
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
    @player.gold += rand(4..8) unless @current_room.visited
    @current_room.visited = true
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
    @player.gold += rand(4..8) unless @current_room.visited
    @current_room.visited = true
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
    @player.gold += rand(4..8) unless @current_room.visited
    @current_room.visited = true
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
    @player.gold += rand(4..8) unless @current_room.visited
    @current_room.visited = true
    @current_room = @repo.find_room(@current_room.row_id, @current_room.column_id + 1)
  end

  # When player enters room, this method determines the room description
  def define_room
    # Center of labyrinth
    if @current_room.row_id.between?(9, 11) && @current_room.column_id.between?(9, 11)
      @view.area_descriptions[:center_area].sample
    # Dark area
    elsif @current_room.row_id.between?(1, 5) && @current_room.column_id.between?(1, 5)
      inner_region_transition_to(5, (1..5), 5, (1..5), :desert_dark_transition, :dark_area)
    # Volcano area
    elsif @current_room.row_id.between?(1, 5) && @current_room.column_id.between?(16, 20)
      inner_region_transition_to(5, (16..20), 16, (1..5), :mountain_volcano_transition, :volcano_area)
    # Swamp area
    elsif @current_room.row_id.between?(16, 20) && @current_room.column_id.between?(16, 20)
      inner_region_transition_to(16, (16..20), 16, (16..20), :jungle_swamp_transition, :swamp_area)
    # Tundra area
    elsif @current_room.row_id.between?(16, 20) && @current_room.column_id.between?(1, 5)
      inner_region_transition_to(16, (1..5), 5, (16..20), :marsh_tundra_transition, :tundra_area)
    # Desert area
    elsif @current_room.row_id.between?(1, 10) && @current_room.column_id.between?(1, 10)
      region_transition_to((1..10), [10], :desert_mountain_transition, :desert_area)
    # Mountain area
    elsif @current_room.row_id.between?(1, 10) && @current_room.column_id.between?(11, 20)
      region_transition_to([10], (11..20), :jungle_mountain_transition, :mountain_area)
    # Jungle
    elsif @current_room.row_id.between?(11, 20) && @current_room.column_id.between?(11, 20)
      region_transition_to((11..20), [11], :jungle_marsh_transition, :jungle_area)
    # Marsh
    elsif @current_room.row_id.between?(11, 20) && @current_room.column_id.between?(1, 10)
      region_transition_to([11], (1..10), :desert_marsh_transition, :marsh_area)
    end
  end

  # Determines room description region changes.
  def region_transition_to(row_range, col_range, trans_descr, area_descr)
    if row_range.include?(@current_room.row_id) && col_range.include?(@current_room.column_id)
      @view.area_transition_descriptions[trans_descr].sample
    else
      @view.area_descriptions[area_descr].sample
    end
  end

  # Determines room description for inner region changes.
  def inner_region_transition_to(row, col_range, col, row_range, trans_descr, area_descr)
    if @current_room.row_id == row && col_range.include?(@current_room.column_id) ||
       @current_room.column_id == col && row_range.include?(@current_room.row_id)
      @view.area_transition_descriptions[trans_descr].sample
    else
      @view.area_descriptions[area_descr].sample
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
    return unless @repo.item_room_indexes.include?(room_index)

    @repo.item_room_indexes.delete(room_index)
    if room_index.odd?
      add_clothing_to_inventory(@repo.all_hats[@new_hat_index])
    else
      add_clothing_to_inventory(@repo.all_robes[@new_robe_index], false)
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
    @view.labyrinth_menu_options(@current_room.role, @last_movement)
    puts "#{'Cᴜʀʀᴇɴᴛ ʀᴏᴏᴍ:'.yellow} #{define_room}"
    slow_dialogue("You've unlocked: #{item_name.yellow}".blink, 0.04, false)
  end

  def normal_or_timer_room
    if timer_room?
      region_timer(11) do
        print "#{@player.name}#{'> '.yellow}"
        @action = gets.chomp.downcase
      end
    else
      print "#{@player.name}#{'> '.yellow}"
      @action = gets.chomp.downcase
    end
    clear
    @view.press_9_to_quit
    puts @view.title_art.yellow
    route_action(@action)
  end

  def timer_room?
    @current_room.row_id.between?(1, 5) && @current_room.column_id.between?(16, 20) ||
    @current_room.row_id.between?(16, 20) && @current_room.column_id.between?(1, 5)
  end

  def region_timer(timer)
    start_time = Time.now
    puts "Don't stay here too long...".red.blink
    yield
    end_time = Time.now
    result = (end_time - start_time).round
    if result >= timer
      @action = '9'
      puts 'You begin to lose consciousness...'.light_black
      sleep(2.5)
      @current_room = @repo.rooms[rand(100..279)]
    end
  end

  # For debugging, shows info about current room.
  def room_info
    puts ''
    puts "#{'-'.yellow} #{'Row:'.light_yellow} #{@current_room.row_id} "
    puts "#{'-'.yellow} #{'Col:'.light_yellow} #{@current_room.column_id}"
    puts "#{'-'.yellow} #{'Role:'.light_yellow} #{@current_room.role}"
    sleep(2.5)
  end
end
