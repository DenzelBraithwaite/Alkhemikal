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
    \n#{"Tutorial>".cyan} The only way to do that#{','.cyan} is to create the majority of potions in the game#{','.cyan} and to make potions you need ingredients#{'!'.cyan}
    \n#{"Tutorial>".cyan} This is where main menu option #1 'exploring' comes in. From here you'll be able to gather ingredients and make a few gold pieces#{'.'.cyan}
    \n#{"Tutorial>".cyan} Not all ingredients are good#{','.cyan} and some runs you'll find more than one ingredient#{'.'.cyan}
    \n#{"Tutorial>".cyan} When you feel like you've found enough ingredients (I'd recommend roughly 26 to start) you can start making potions#{'!'.cyan}
    \n#{"Tutorial>".cyan} #3 'Billywig' is a fun little minigame that resembles blackjack. Give it a try and see if you can best Gruntilda#{'.'.cyan}
    \n#{"Tutorial>".cyan} #4 'Labyrinth' is my personal fav#{','.cyan} you navigate a 400 room maze to find items for your witch#{'!'.cyan}
    \n#{"Tutorial>".cyan} Aaannd#{','.cyan} #5 you have your inventory#{','.cyan} where you can change your hat and robe or even your name#{'!'.cyan}
    \n#{"Tutorial>".cyan} Finally#{','.cyan} #6 you have the shopekeeper#{','.cyan} where you can buy things for your witch#{'!'.cyan}
    \n#{"Tutorial>".cyan} Each option has it's own tutorial so don't worry#{','.cyan} if you're ever lost#{','.cyan} run the tutorial one more time#{'.'.cyan}
    \n#{"Tutorial>".cyan} Enjoy#{'!'.cyan}"
    @tips = [
      "Keep pressing #{"'".cyan}enter#{"'".cyan} in a menu to cycle through the tips #{'/'.cyan} hints#{'.'.cyan}",
      "You can change your name in #{"'".cyan}Inventory#{"'".cyan} ",
      "It#{"'".cyan}s better to catch 20#{'-'.cyan}30 ingredients before making potions#{'.'.cyan}",
      "You can die in the labyrinth, but you won#{"'".cyan}t lose any items. The next time you play you#{"'".cyan}ll start in a different room#{'.'.cyan}",
      "The game received a minor anniversary update. You might find a few new references to #{'27'.cyan} instead of #{'26'.cyan}.",
      "Although you can't lose items in the labyrinth, you CAN lose gold, so watch out#{'!'.cyan}"
    ]
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

    @demo_version = "\n
                    #{'Beta version 2.1:'.light_black} ---------- #{'Added labyrinth'.yellow}\n
                    #{'Beta version 2.2:'.light_black} ---------- #{'Designed menus'.cyan}\n
                    #{'Beta version 2.3:'.light_black} ---------- #{'Revamped Billywig'.light_cyan}\n
                    #{'Beta version 2.4:'.light_black} ---------- #{'Revamped Potions'.light_magenta}\n
                    #{'Beta version 3.0:'.light_black} ---------- #{'Revamped entire labyrinth'.yellow}\n
                    #{'Beta version 3.1:'.light_black} ---------- #{'Added labyrinth navigation helpers'.yellow}\n
                    #{'Beta version 3.2:'.light_black} ---------- #{'Added tips to all menus'.cyan}\n
                    #{'Beta version 4.0:'.light_black} ---------- #{'Added shop and gold currency to game'.blue}\n
                    #{'Full version 1.0:'.light_black} ---------- #{'Added special effects to robes'.light_black}\n
                    #{'Full version 1.1:'.light_black} ---------- #{'Improved potions recipe display + added dialogue in various places'.light_magenta}\n
                    #{'Full Version 1.2:'.light_white.on_light_cyan} ---------- What's new? #{'Added Stats menu in labyrinth mode!'.yellow.blink}
                    "
  end

  def special_thanks
    puts "
    █████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
    █░░░░░░░░░░░░░░█░░░░░░░░░░░░░░█░░░░░░░░░░░░░░█░░░░░░░░░░░░░░█░░░░░░░░░░█░░░░░░░░░░░░░░█░░░░░░████████████░░░░░░░░░░░░░░█░░░░░░██░░░░░░█░░░░░░░░░░░░░░█░░░░░░██████████░░░░░░█░░░░░░██░░░░░░░░█░░░░░░░░░░░░░░█
    █░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░████████████░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░░░░░░░░░██░░▄▀░░█░░▄▀░░██░░▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█
    █░░▄▀░░░░░░░░░░█░░▄▀░░░░░░▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░░░░░░░░░█░░░░▄▀░░░░█░░▄▀░░░░░░▄▀░░█░░▄▀░░████████████░░░░░░▄▀░░░░░░█░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░░░█░░▄▀░░░░░░░░░░█
    █░░▄▀░░█████████░░▄▀░░██░░▄▀░░█░░▄▀░░█████████░░▄▀░░███████████░░▄▀░░███░░▄▀░░██░░▄▀░░█░░▄▀░░████████████████░░▄▀░░█████░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░███░░▄▀░░█████████
    █░░▄▀░░░░░░░░░░█░░▄▀░░░░░░▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░███████████░░▄▀░░███░░▄▀░░░░░░▄▀░░█░░▄▀░░████████████████░░▄▀░░█████░░▄▀░░░░░░▄▀░░█░░▄▀░░░░░░▄▀░░█░░▄▀░░██░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░▄▀░░███░░▄▀░░░░░░░░░░█
    █░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░███████████░░▄▀░░███░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░████████████████░░▄▀░░█████░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀░░██░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░███░░▄▀▄▀▄▀▄▀▄▀░░█
    █░░░░░░░░░░▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░░░░░░░░░█░░▄▀░░███████████░░▄▀░░███░░▄▀░░░░░░▄▀░░█░░▄▀░░████████████████░░▄▀░░█████░░▄▀░░░░░░▄▀░░█░░▄▀░░░░░░▄▀░░█░░▄▀░░██░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░▄▀░░███░░░░░░░░░░▄▀░░█
    █████████░░▄▀░░█░░▄▀░░█████████░░▄▀░░█████████░░▄▀░░███████████░░▄▀░░███░░▄▀░░██░░▄▀░░█░░▄▀░░████████████████░░▄▀░░█████░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░░░░░▄▀░░█░░▄▀░░██░░▄▀░░███████████░░▄▀░░█
    █░░░░░░░░░░▄▀░░█░░▄▀░░█████████░░▄▀░░░░░░░░░░█░░▄▀░░░░░░░░░░█░░░░▄▀░░░░█░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░░░░░████████░░▄▀░░█████░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀░░░░█░░░░░░░░░░▄▀░░█
    █░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░█████████░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░████████░░▄▀░░█████░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀░░██░░░░░░░░░░▄▀░░█░░▄▀░░██░░▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█
    █░░░░░░░░░░░░░░█░░░░░░█████████░░░░░░░░░░░░░░█░░░░░░░░░░░░░░█░░░░░░░░░░█░░░░░░██░░░░░░█░░░░░░░░░░░░░░████████░░░░░░█████░░░░░░██░░░░░░█░░░░░░██░░░░░░█░░░░░░██████████░░░░░░█░░░░░░██░░░░░░░░█░░░░░░░░░░░░░░█
    █████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████"
    puts ''
    puts ''
    puts ''
    puts "
    ╭━━━┳╮
    ┃╭━━┫┃
    ┃╰━━┫┃╭┳━━┳━━╮
    ┃╭━━┫┃┣┫━━┫╭╮┃
    ┃╰━━┫╰┫┣━━┃╭╮┃
    ╰━━━┻━┻┻━━┻╯╰╯"
    sleep(1)
    puts "
    ╱╱╭╮╱╱╱╱╱╭╮
    ╱╱┃┃╱╱╱╱╭╯╰╮
    ╱╱┃┣╮╭┳━┻╮╭╋┳━╮
    ╭╮┃┃┃┃┃━━┫┃┣┫╭╮╮
    ┃╰╯┃╰╯┣━━┃╰┫┃┃┃┃
    ╰━━┻━━┻━━┻━┻┻╯╰╯"
    sleep(1)
    puts "
    ╭━╮╭━╮╱╱╭╮
    ┃┃╰╯┃┃╱╭╯╰╮
    ┃╭╮╭╮┣━┻╮╭╯
    ┃┃┃┃┃┃╭╮┃┃
    ┃┃┃┃┃┃╭╮┃╰╮
    ╰╯╰╯╰┻╯╰┻━╯"
    sleep(1)
    puts "
    ╭━━━╮╱╱╭╮╱╱╱╱╱╭╮
    ┃╭━╮┃╱╱┃┃╱╱╱╱╱┃┃
    ┃╰━━┳━━┫╰━┳━━┳┫┃
    ╰━━╮┃╭╮┃╭╮┃┃━╋┫┃
    ┃╰━╯┃╰╯┃┃┃┃┃━┫┃╰╮
    ╰━━━┻━━┻╯╰┻━━┻┻━╯"
    sleep(2)
  end

  def easter_egg26
    2.times do
      puts 'congrats, you found an easter egg :)'.black.on_white.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_black.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.red.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_red.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.green.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_green.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.yellow.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_yellow.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.blue.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_blue.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.magenta.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_magenta.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.cyan.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_cyan.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.white.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_white.blink
    end
    sleep(1)
    puts "This is a message from the future, happy 27th* Bday :)".light_white.blink
    sleep(3)
  end

  def easter_egg27
    2.times do
      puts 'congrats, you found an easter egg :)'.black.on_white.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_black.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.red.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_red.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.green.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_green.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.yellow.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_yellow.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.blue.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_blue.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.magenta.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_magenta.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.cyan.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_cyan.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.white.blink
      sleep(0.10)
      puts 'congrats, you found an easter egg :)'.light_white.blink
    end
    sleep(1)
    puts "This is a message from the future, happy 27th* Bday :)".light_white.blink
    sleep(3)
  end

  def get_user_name
    puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".cyan} Before I forget#{','.cyan} what's your name my dear witch#{'?'.cyan}"
    print "> "
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
