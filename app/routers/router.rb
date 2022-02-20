require 'colorize'
require_relative '../views/main_view'

class Router
  attr_reader :witch_name

  def initialize(basic_controller, explore_controller, main_controller, billywig_controller) # potions_controller, explore_controller, maze_controller)
    @running = true
    @view = MainView.new
    @basic_controller = basic_controller
    @main_controller = main_controller
    @explore_controller = explore_controller
    # @potions_controller = potions_controller
    @billywig_controller = billywig_controller
    # @maze_controller = maze_controller
  end

  def run
    # Display demo version number, sleeps then clears screen.
    # puts @view.demo_version
    # sleep(2.5)
    # @main_controller.clear

    # Display opening art sequence, sleeps then prompts to continue and clears.
    # @main_controller.first_loading_screen

    # Display intro message
    # puts @view.intro_message

    # Gets users name and stores it
    @witch_name = @view.get_user_name
    synchronize_witch_name(@witch_name)
    @main_controller.continue_prompt
    @main_controller.clear

    while @running
      main_menu_options
      action = gets.chomp.to_i
      @main_controller.clear
      route_action(action)
      @main_controller.clear
    end
  end

  private

  def route_action(action)
    case action
    when 1
      @main_controller.fast_loading
      @explore_controller.run
    # when 2
      # @main_controller.fast_loading
      # @potions_controller.run
    when 3
      @main_controller.fast_loading
      @billywig_controller.run
    # when 4
      # @main_controller.fast_loading
      # @maze_controller.run
    when 9 then stop
    else
    @view.invalid_option
    @main_controller.clear
    end
  end

  def stop
    @running = false
  end

  def main_menu_options
    puts @view.title_art.light_blue.blink
    @main_controller.line
    puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ?"
    @main_controller.line(1)
    puts "1 - 𝔼𝕩𝕡𝕝𝕠𝕣𝕖".light_yellow
    @main_controller.line(0.25)
    puts "2 - ℙ𝕠𝕥𝕚𝕠𝕟s".light_yellow
    @main_controller.line(0.25)
    puts "3 - 𝔹𝕚𝕝𝕝𝕪𝕎𝕚𝕘".light_yellow
    @main_controller.line(0.25)
    # puts "4 - Maze Runner".light_yellow
    # @main_controller.line(0.25)
    puts "9 - ℚ𝕦𝕚𝕥".light_red
    2.times { @main_controller.line(0.1) }
    print "#{@witch_name}> ".light_cyan
  end

  def synchronize_witch_name(witch_name)
    @main_controller.witch_name = witch_name
    @billywig_controller.witch_name = witch_name
    @explore_controller.witch_name = witch_name
    # @potions_controller.witch_name = witch_name
    # @maze_controller.witch_name = witch_name
  end
end