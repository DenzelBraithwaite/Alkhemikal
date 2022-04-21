require 'colorize'
require_relative 'models/witch'
require_relative 'views/main_view'

class Router
  def initialize(parent_controller, main_controller, explore_controller, potion_controller, billywig_controller, labyrinth_controller, inventory_controller)
    @running = true
    @view = MainView.new
    @parent_controller = parent_controller
    @main_controller = main_controller
    @explore_controller = explore_controller
    @potion_controller = potion_controller
    @billywig_controller = billywig_controller
    @labyrinth_controller = labyrinth_controller
    @inventory_controller = inventory_controller
    @player = @parent_controller.player
  end

  def run
    @main_controller.clear
    # Display demo version number, sleeps then clears screen.
    puts @view.demo_version
    # sleep(1.5)

    # Display opening art sequence, sleeps then prompts to continue and clears.
    # @main_controller.first_loading_screen

    # Display intro message
    # @parent_controller.slow_dialogue(@view.intro_message)

    # Gets users name and stores it, used below to save the name prompt for all menus
    # @player.name = @view.get_user_name.capitalize
    @player.name = "Test mode"
    @player.name = @parent_controller.capitalize_sentence(@player.name)
    synchronize_witch_name
    # @main_controller.continue_prompt
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
    when 1 then @explore_controller.run
    when 2 then @potion_controller.run
    when 3 then @billywig_controller.run
    when 4 then @labyrinth_controller.menu
    when 5 then @inventory_controller.run
    when 6 then @main_controller.tutorial
    when 9 then stop
    else
    @view.invalid_option
    @main_controller.clear
    end
  end

  def stop
    puts @view.game_over
   puts "Game over #{@player.name}..."
   sleep(3.5)
    @running = false
  end

  def main_menu_options
    print "Tɪᴘ: ".light_cyan
    puts @view.tips.sample
    puts ''
    puts @view.title_art.light_cyan.blink
    @main_controller.line
    puts " Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ #{'?'.light_cyan}"
    @main_controller.line(0.05)
    puts " 𝟙 #{'-'.light_cyan} 𝔼𝕩𝕡𝕝𝕠𝕣𝕖"
    @main_controller.line(0.05)
    puts " 𝟚 #{'-'.light_cyan} ℙ𝕠𝕥𝕚𝕠𝕟s"
    @main_controller.line(0.05)
    puts " 𝟛 #{'-'.light_cyan} 𝔹𝕚𝕝𝕝𝕪𝕎𝕚𝕘"
    @main_controller.line(0.05)
    puts " 𝟜 #{'-'.light_cyan} 𝕃𝕒𝕓𝕪𝕣𝕚𝕟𝕥𝕙"
    @main_controller.line(0.05)
    puts " 𝟝 #{'-'.light_cyan} 𝕀𝕟𝕧𝕖𝕟𝕥𝕠𝕣𝕪"
    @main_controller.line(0.05)
    puts " 𝟞 #{'-'.light_cyan} 𝕋𝕦𝕥𝕠𝕣𝕚𝕒𝕝"
    @main_controller.line(0.05)
    puts " 𝟡 #{'-'.light_cyan} #{'ℚ𝕦𝕚𝕥'.light_red}"
    2.times { @main_controller.line(0.1) }
    print "#{@player.name}#{'> '.light_cyan}"
  end

  def synchronize_witch_name
    @main_controller.player = @player
    @billywig_controller.player = @player
    @explore_controller.player = @player
    @potion_controller.player = @player
    @labyrinth_controller.player = @player
    @inventory_controller.player = @player
  end
end
