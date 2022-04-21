require 'colorize'

class MainView
  attr_reader :intro_message, :tutorial_message, :title_art, :demo_version,:witch_art, :game_over, :tips

  def initialize
    @intro_message = "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.cyan} Welcome, to the small town of Alkhemikal, home to the greatest witches ever born.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} As there is little foolish wand-waving here, you will hardly believe this is magic.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} But rest assured, if you follow my every instruction, I'll make a witch out of you yet, nyaakaka.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Let the delicate power of liquids that creep through your veins bewitch your mind and ensnare your senses...
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} I will teach you how to bottle liquid light, brew glory, and even capture the essence of flames.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} You show promise, let's hope you aren't as big a dunderhead as the last one.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} He created a - now forbidden... potion that is irreversible. It's called the \"Vile vial of Amortentia\"
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Never, EVER, create the vial of Amortentia... Ever!
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} I'll be here to guide you as you progress, but for now I must leave you.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Enjoy yourself, be careful and have fun! Oh, and again, don't even THINK about making that potion!"
    # Main menu tutorial
    @tutorial_message = "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.cyan} Hello, here's a quick guide to get started.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} The main menu has several options to choose from, let's start with #2, 'potion making'.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Potion making is the core of the game. To beat the game, you need to create the forbidden potion.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} The only way to do that, is to create every potion in the game, and to make a potion you need ingredients.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} This is where main menu option #1 'exploring' comes in. From here you'll be able to gather ingredients.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Not all ingredients are good, and some runs you'll find more than one ingredient.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} When you feel like you've found enough ingredients (I'd recommend roughly 26 to start) you can start making potions!
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} #3 'Billywig' is a fun little minigame that resembles blackjack. Give it a try and see if you can best Gruntilda.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} #4 'Labyrinth' is my personal fav, you navigate a 400 room maze to find clothing for your witch.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} The labyrinth is also a minigame at the moment, but I'd like to incorporate it more in the future
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Finally, #5 you have your inventory, where you can change your hat and robe or even your name!
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Each option has it's own tutorial so don't worry, if you're ever lost, run the tutorial one more time.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Enjoy!"
    @tips = [
      "Keep pressing #{"'".cyan}enter#{"'".cyan} in a menu to cycle through the tips #{'/'.cyan} hints#{'.'.cyan}",
      "You can change your name in #{"'".cyan}Inventory#{"'".cyan} ",
      "It#{"'".cyan}s better to catch 20#{'-'.cyan}30 ingredients before making potions#{'.'.cyan}",
      "You can die in the labyrinth, but you won#{"'".cyan}t lose any items. The next time you play you#{"'".cyan}ll start in a different room#{'.'.cyan}"]
    @title_art = "
              ░█████╗░██╗░░░░░██╗░░██╗██╗░░██╗███████╗███╗░░░███╗██╗██╗░░██╗░█████╗░██╗░░░░░
              ██╔══██╗██║░░░░░██║░██╔╝██║░░██║██╔════╝████╗░████║██║██║░██╔╝██╔══██╗██║░░░░░
              ███████║██║░░░░░█████═╝░███████║█████╗░░██╔████╔██║██║█████═╝░███████║██║░░░░░
              ██╔══██║██║░░░░░██╔═██╗░██╔══██║██╔══╝░░██║╚██╔╝██║██║██╔═██╗░██╔══██║██║░░░░░
              ██║░░██║███████╗██║░╚██╗██║░░██║███████╗██║░╚═╝░██║██║██║░╚██╗██║░░██║███████╗
              ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝"

    @witch_art = '
    (       "     )
     ( _  *
        * (     /      \    ___
           "     "        _/ /
          (   *  )    ___/   |
            )   "     _ o)\'-./__
           *  _ )    (_, . $$$
           (  )   __ __ 7_ $$$$
            ( :  { _)  \'---  $\
       ______\'___//__\   ____, \
        )           ( \_/ _____\_
      .\'             \   \------\'\'.
      |=\'           \'=|  |         )
      |               |  |  .    _/
       \    (. ) ,   /  /__I_____\
     \'._/_)_(\__.\'   (__,(__,_]
       @---()_.\'---@  '
    # Only use when exitingthe game after creating the final potion
    @game_over = "
    |/|
    | |
    |/|
    | |
    |/|
   (___)
   (___)
   (___)
   (___)
   (___)
   // \\\\
  //   \\\\
 ||     ||
 ||     ||
 ||     ||
  \\\\___//
   -----"

    @demo_version = "Current: Demo Version 3.1 - last update: #{'Added labyrinth navigation helpers'.yellow}\n
                    Current: Demo Version 3.0 - last update: #{'Revamped entire labyrinth'.yellow}\n
                    Current: Demo Version 2.4 - last update: #{'Potions revamped'.light_magenta}\n
                    Current: Demo Version 2.3 - last update: #{'Billywig re-vamped'.light_cyan}\n
                    Previos: Demo Version 2.2 - last update: #{'menus color design'.yellow}\n
                    Previous: Demo Version 2.1 - last update: #{'labyrinth'.yellow}"
  end

  def get_user_name
    puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Before I forget, what's your name my dear witch?"
    name = gets.chomp.downcase
    puts "Ahhh #{name}, a wicked name indeed!"
    return name
  end

  def invalid_option
    puts @title_art.light_cyan.blink
    puts ""
    puts "Please select a valid option".light_red
    sleep(0.8)
  end

end
