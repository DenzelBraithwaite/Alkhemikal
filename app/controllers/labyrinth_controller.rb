require_relative '../views/labyrinth_view'
require_relative '../repo/labyrinth_repo'

# Add Billywig controller and hide it in a room
class LabyrinthController < ParentController
  attr_accessor :number_of_saves_used

  def initialize(repo)
    super(player)
    @view = LabyrinthView.new
    @repo = repo
    @new_hat_index = 0
    @new_robe_index = 0
    @center_ingredient_found = false
    @number_of_saves_used = 0
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
      @view.invalid_option
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
    @current_run_gold = 0
    @running = true
    @last_movement = @last_movement || "none"
    @current_room = @current_room || @repo.rooms[rand(100..279)] #189 center

    while @running
      clear
      @view.press_9_to_quit
      @view.labyrinth_menu_options(@current_room.role, @last_movement)
      @view.current_clothing(@player.current_hat, @player.current_robe)
      puts "#{'Current Region:'.yellow} #{define_room}"
      puts @view.room_visited?(@current_room)
      puts ''
      puts "Loot #{@current_run_gold.to_s.yellow}#{'G'.yellow}"
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
    when "9"
      @player.gold += @current_run_gold
      @running = false
    when "info" then room_info
    else
      @view.invalid_option
    end
  end

  # Checks if up is valid, if true then change current room to the room up above.
  def move_up?
    if @current_room.up
      move_up
      puts @view.move_to_next_room
      @last_movement = 'up'
    else
      @view.display_no_room
    end
    sleep(0.75)
  end

  def move_up
    @current_run_gold += rand(10..30) unless @current_room.visited
    @current_run_gold += rand(2..4) if @player.current_robe == "little red riding hood"
    @current_room.visited = true
    @current_room = @repo.find_room(@current_room.row_id - 1, @current_room.column_id)
  end

  # Checks if down is valid, if false then change current room to the room down below.
  def move_down?
    if @current_room.down
      move_down
      puts @view.move_to_next_room
      @last_movement = 'down'
    else
      @view.display_no_room
    end
    sleep(0.75)
  end

  def move_down
    @current_run_gold += rand(10..30) unless @current_room.visited
    @current_run_gold += rand(2..4) if @player.current_robe == "little red riding hood"
    @current_room.visited = true
    @current_room = @repo.find_room(@current_room.row_id + 1, @current_room.column_id)
  end

  # Checks if left is valid, if false then change current room to the room on the left.
  def move_left?
    if @current_room.left
      move_left
      puts @view.move_to_next_room
      @last_movement = 'left'
    else
      @view.display_no_room
    end
    sleep(0.75)
  end

  def move_left
    @current_run_gold += rand(10..30) unless @current_room.visited
    @current_run_gold += rand(2..4) if @player.current_robe == "little red riding hood"
    @current_room.visited = true
    @current_room = @repo.find_room(@current_room.row_id, @current_room.column_id - 1)
  end

  # Checks if right is valid, if true then change current room to the room on the right.
  def move_right?
    if @current_room.right
      move_right
      puts @view.move_to_next_room
      @last_movement = 'right'
    else
      @view.display_no_room
    end
    sleep(0.75)
  end

  def move_right
    @current_run_gold += rand(10..30) unless @current_room.visited
    @current_run_gold += rand(2..4) if @player.current_robe == "little red riding hood"
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
      @player.hats << clothing
      @new_hat_index += 1
    else
      new_item_alert("ROBE", clothing)
      @player.robes << clothing
      @new_robe_index += 1
    end
  end

  # Adds the only ingredient that can be found in the labyrinth, required for final potion
  def center_labyrinth_ingredient
    return if @center_ingredient_found
    new_item_alert('? ! ? ', 'Telephonic device')
    puts "You have no earthly idea what this could be....".light_black
    @player.ingredients << 'telephonic device'
    @center_ingredient_found = true
    continue_prompt
  end

  # A list of all rooms with hidden clothing, if entered, it will be added to your inventory.
  def check_if_room_is_special
    room_index = @repo.find_room_index(@current_room.row_id, @current_room.column_id)
    center_labyrinth_ingredient if @current_room == @repo.rooms[189]
    if @repo.dark_death_rooms.include?(room_index)
      return if @player.current_robe == 'dark cloak'

      @number_of_saves_used += 1 if @player.current_robe == "wizard's robe"
      return if @number_of_saves_used == 1 && @player.current_robe == "wizard's robe"

      death_in_labyrinth('dark')
    end
    return unless @repo.item_room_indexes.include?(room_index)

    @repo.item_room_indexes.delete(room_index)
    @current_run_gold += 100
    if room_index.odd?
      add_clothing_to_inventory(@repo.all_hats[@new_hat_index])
    else
      add_clothing_to_inventory(@repo.all_robes[@new_robe_index], false)
    end
  end

  # If player dies in maze from dark region
  def death_in_labyrinth(region)
    dark_death_reasons = [
      'You hear footsteps rapidly approaching from all directions.',
      'You slip, fall and hit your head on something.',
      'Out of nowhere, someone grabs you and blocks your breathing.'
    ]
    tundra_death_reasons = [
      'Your body collapses, your legs have gone numb from the cold.',
      'You slip on ice and hit your head.',
      'The cold is more than you can handle, you stayed too long.'
    ]
    volcano_death_reasons = [
      'Your skin starts to burn, the pain is too much to handle.',
      'The smoke is too thick, you struggle to catch your breath.',
      'The heat is more than you can handle, you stayed too long.'
    ]
    case region
    when 'dark' then puts dark_death_reasons.sample.light_black
    when 'tundra'
      return if @player.current_robe == 'blue kirtle'

      puts tundra_death_reasons.sample.light_black
    when 'volcano'
      return if @player.current_robe == 'ash grey capelet'

      puts volcano_death_reasons.sample.light_black
    end

    sleep(3)
    puts 'You wake up somewhere completely different, your gold is missing...'.light_black
    continue_prompt
    puts "You #{'lost -'.red}#{@current_run_gold.to_s.red} gold."
    sleep(3)
    @current_run_gold = 0 unless @player.current_robe == 'magic cape'
    @current_room = @repo.rooms[rand(100..279)]
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

  def get_direction
    print "#{@player.name}#{'> '.yellow}"
    @action = gets.chomp.downcase
  end

  def normal_or_timer_room
    if timer_room?
      # Sets dialogue for volcano region
      if @current_room.row_id.between?(1, 5) && @current_room.column_id.between?(16, 20)
        region_timer(10.5, 'volcano') do
          get_direction
        end
      # Sets dialogue for tundra region
      elsif @current_room.row_id.between?(16, 20) && @current_room.column_id.between?(1, 5)
        region_timer(10.5, 'tundra') do
          get_direction
        end
      else
        get_direction
      end
    else
      get_direction
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

  def region_timer(timer, region)
    start_time = Time.now
    puts "Don't stay here too long...".red.blink
    yield
    end_time = Time.now
    result = (end_time - start_time).round
    return unless result >= timer

    case region
    when 'volcano' then death_in_labyrinth('volcano')
    when 'tundra' then death_in_labyrinth('tundra')
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
