require 'colorize'

class MainView
  attr_reader :intro_message, :tutorial_message, :title_art, :demo_version,:witch_art, :game_over, :tips

  def initialize
    @intro_message = "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.cyan} Welcome#{','.cyan} to the small town of Alkhemikal#{','.cyan} home to the greatest witches ever born#{'.'.cyan}
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} As there is little foolish wand-waving here#{','.cyan} you will hardly believe this is magic#{'.'.cyan}
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} But rest assured#{','.cyan} if you follow my every instruction#{','.cyan} I'll make a witch out of you yet#{','.cyan} nyaakaka#{'.'.cyan}
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Let the delicate power of liquids that creep through your veins bewitch your mind and ensnare your senses#{'...'.cyan}
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} I will teach you how to bottle liquid light#{','.cyan} brew glory#{','.cyan} and even capture the essence of flames#{'.'.cyan}
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} You show promise#{','.cyan} let's hope you aren't as big a dunderhead as the last one#{'.'.cyan}
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} He created a - now forbidden#{'...'.cyan} potion that is irreversible#{'.'.cyan} It's called the 'Vile vial of Amortentia'#{'.'.cyan}
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Never#{','.cyan} EVER#{','.cyan} create the vial of Amortentia#{'...'.cyan} Ever#{'!'.cyan}
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} I'll be here to guide you as you progress#{','.cyan} but for now I must leave you#{'.'.cyan}
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Enjoy yourself#{','.cyan} be careful and have fun! Oh#{','.cyan} and again#{','.cyan} don't even THINK about making that potion#{'!'.cyan}"
    # Main menu tutorial
    @tutorial_message = "#{'Tutorial>'.cyan} Hello#{','.cyan} here's a quick guide to get started#{'.'.cyan}
    \n#{"Tutorial>".cyan} The main menu has several options to choose from#{','.cyan} let's start with #2#{','.cyan} 'potion making'#{'.'.cyan}
    \n#{"Tutorial>".cyan} Potion making is the core of the game. To beat the game#{','.cyan} you need to create the forbidden potion#{'.'.cyan}
    \n#{"Tutorial>".cyan} The only way to do that#{','.cyan} is to create every potion in the game#{','.cyan} and to make a potion you need ingredients#{'.'.cyan}
    \n#{"Tutorial>".cyan} This is where main menu option #1 'exploring' comes in. From here you'll be able to gather ingredients#{'.'.cyan}
    \n#{"Tutorial>".cyan} Not all ingredients are good#{','.cyan} and some runs you'll find more than one ingredient#{'.'.cyan}
    \n#{"Tutorial>".cyan} When you feel like you've found enough ingredients (I'd recommend roughly 26 to start) you can start making potions#{'!'.cyan}
    \n#{"Tutorial>".cyan} #3 'Billywig' is a fun little minigame that resembles blackjack. Give it a try and see if you can best Gruntilda#{'.'.cyan}
    \n#{"Tutorial>".cyan} #4 'Labyrinth' is my personal fav#{','.cyan} you navigate a 400 room maze to find clothing for your witch#{'.'.cyan}
    \n#{"Tutorial>".cyan} The labyrinth is also a minigame at the moment#{','.cyan} but I'd like to incorporate it more in the future#{'.'.cyan}
    \n#{"Tutorial>".cyan} Finally#{','.cyan} #5 you have your inventory#{','.cyan} where you can change your hat and robe or even your name#{'!'.cyan}
    \n#{"Tutorial>".cyan} Each option has it's own tutorial so don't worry#{','.cyan} if you're ever lost#{','.cyan} run the tutorial one more time#{'.'.cyan}
    \n#{"Tutorial>".cyan} Enjoy#{'!'.cyan}"
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

    @demo_version = "Current: Demo Version 4.0 - last update: #{'Added shop and gold currency to game'.blue}\n
                    Current: Demo Version 3.2 - last update: #{'Added tips to all menus'.cyan}\n
                    Current: Demo Version 3.1 - last update: #{'Added labyrinth navigation helpers'.yellow}\n
                    Current: Demo Version 3.0 - last update: #{'Revamped entire labyrinth'.yellow}\n
                    Current: Demo Version 2.4 - last update: #{'Potions revamped'.light_magenta}\n
                    Current: Demo Version 2.3 - last update: #{'Billywig re-vamped'.light_cyan}\n
                    Previos: Demo Version 2.2 - last update: #{'menus color design'.cyan}\n
                    Previous: Demo Version 2.1 - last update: #{'labyrinth'.yellow}"
  end

  def get_user_name
    puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Before I forget#{','.cyan} what's your name my dear witch#{'?'.cyan}"
    name = gets.chomp.downcase
    puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Ahhh #{name.capitalize.cyan}, a wicked name indeed#{'!'.cyan}"
    return name
  end

  def invalid_option
    puts @title_art.light_cyan.blink
    puts ""
    puts "Please select a valid option".light_red
    sleep(0.8)
  end

end
