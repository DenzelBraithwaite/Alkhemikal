require 'colorize'

class PotionMakingView < MainView
	attr_reader :intro_message, :potion_tutorial1, :potion_tutorial2, :good_potion_text, :bad_potion_text, :recipes_art, :ingredients_art

  def initialize
    @title_art = "
    ██████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗	███╗░░░███╗░█████╗░██╗░░██╗██╗███╗░░██╗░██████╗░██╗
    ██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║	████╗░████║██╔══██╗██║░██╔╝██║████╗░██║██╔════╝░██║
    ██████╔╝██║░░██║░░░██║░░░██║██║░░██║██╔██╗██║	██╔████╔██║███████║█████═╝░██║██╔██╗██║██║░░██╗░██║
    ██╔═══╝░██║░░██║░░░██║░░░██║██║░░██║██║╚████║	██║╚██╔╝██║██╔══██║██╔═██╗░██║██║╚████║██║░░╚██╗╚═╝
    ██║░░░░░╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║	██║░╚═╝░██║██║░░██║██║░╚██╗██║██║░╚███║╚██████╔╝██╗
    ╚═╝░░░░░░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝	╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝"
    @recipes_art = "
    ██████╗░███████╗░█████╗░██╗██████╗░███████╗░██████╗
    ██╔══██╗██╔════╝██╔══██╗██║██╔══██╗██╔════╝██╔════╝
    ██████╔╝█████╗░░██║░░╚═╝██║██████╔╝█████╗░░╚█████╗░
    ██╔══██╗██╔══╝░░██║░░██╗██║██╔═══╝░██╔══╝░░░╚═══██╗
    ██║░░██║███████╗╚█████╔╝██║██║░░░░░███████╗██████╔╝
    ╚═╝░░╚═╝╚══════╝░╚════╝░╚═╝╚═╝░░░░░╚══════╝╚═════╝░"
    @ingredients_art = "
    ██╗███╗░░██╗░██████╗░██████╗░███████╗██████╗░██╗███████╗███╗░░██╗████████╗░██████╗
    ██║████╗░██║██╔════╝░██╔══██╗██╔════╝██╔══██╗██║██╔════╝████╗░██║╚══██╔══╝██╔════╝
    ██║██╔██╗██║██║░░██╗░██████╔╝█████╗░░██║░░██║██║█████╗░░██╔██╗██║░░░██║░░░╚█████╗░
    ██║██║╚████║██║░░╚██╗██╔══██╗██╔══╝░░██║░░██║██║██╔══╝░░██║╚████║░░░██║░░░░╚═══██╗
    ██║██║░╚███║╚██████╔╝██║░░██║███████╗██████╔╝██║███████╗██║░╚███║░░░██║░░░██████╔╝
    ╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═════╝░"

    @intro_message = "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} You are about to learn the subtle science and exact art of potion-making.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} As there is little foolish wand-waving here, many of you will hardly believe this is magic.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I don't expect you will really understand the beauty of the softly simmering cauldron with its shimmering fumes,
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} the delicate power of liquids that creep through the human veins, bewitching the minds, ensnaring the senses...
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I can teach you how to bottle liquid light, brew glory, and even capture the essence of flames.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Let's hope you aren't as big a dunderhead as the last one.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} He created a - now forbidden... potion that is irreversible. It's called the \"Vile vial of Amortentia\"
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Never, EVER, create the vial of Amortentia... Ever!"

    @potion_tutorial1 = "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} It's time to learn and in time; master, the subtle science of potion-making.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} This will not be easy and you will fail many times, but a true witch knows failure preceeds greatness.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I don't expect you will really understand the beauty of the softly simmering cauldron with its shimmering fumes,
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Get lost in a world of forgotten arts, once passed down through a bloodline of incredible magical beings!
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I will do my best to teach you the basics, but after that, you're on your own.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Are you ready to create your first potion? I hope you brought all the necessary ingredients...
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} You can leave this place at any time if you start to run low, there's a forest out back with plenty of fresh resources.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} If you fancy some new garments, you can always test your luck in the witch's labyrinth beside the forest.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Let me know when you're ready to begin, and once you start... there's no going back."

    @potion_tutorial2 = "#{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} Alright, to be honest potion making is actually incredibly intuitive,
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} you simply need to mix 2 ingredients together in a cauldron and see what happens.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Certain potions are a little special, and may require more ingredients or special ingredients,
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} but please don't get consumed by the process, it's an art but by no means is it an obsession!
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Let me see what ingredients you've brought...Akkk! You barely have anything!
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I guess we'll have to make the brew of beginnings, a wise first choice for any novice potion maker.
    \n#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Here's the recipe, you get to look at it but it's MINE so you can't keep it! Make your own.."
    # Array of things to say when a good potion is created
    @good_potion_text = [
      'A stellar potion indeed.',
      "If you keep at it like that you'll be a master in no time.",
      "NYAAAKAKAAA that's what I'm talking about!",
      'Hmph! Not bad..',
      'Excellent work!',
      "You're a natural.",
      'I remember the first time I made that, NYAAAKAKAAA!',
      "Now you're starting to get the hang of it.",
      'A truer witch there is none, greatness flows through your veins!'
    ]
    # Array of things to say when a bad potion is created
    @bad_potion_text = [
      'Quit wasting time and make something useful.',
      "I can't imagine what anyone would do with this?",
      'NYAAAKAKAAA, you just created POOP! NYAAAAAAAAAAAAAAAAAAAKAKAKAKAKaAaaahh.. Now clean the cauldron',
      "Umm.... I think it's safe to say we don't need this",
      'Are you even trying???',
      "You can't use just any ingredients silly witch.",
      'Throw that away now!',
      "Sweet Mortis! I can't remember the last time I saw a potion that bad..",
      'Yet another failure...',
      'What is that? A cure for boils? YEEK, give that to the cat.',
      "That 'potion' smells worse than you do, NYAAAKAKAAA!!",
      "As thick as a Wiggentree's bark aren't you? Start again!",
      "Do you have any idea what you're doing?",
      'I thought you said you were a witch.',
      'I liken that potion to a giant Glumbumble dung beetle. START OVER!!',
      "Is that an ageing potion? NYAAAK, I'll be taking that! Now then, continue.",
      "That almost looked like the Elixir of life, but even I've never managed to make that one. Start over",
      'STOOOOOOOOOOOP!!! NYAAAK, you almost made an exploding potion!!! Throw that out back and clean the cauldron well!',
      "Hmm, almost smells like polyjuice potions. That's been banned though, so try something new.",
      "Is that... Are you making a kissing concoction? I'm flattered but please take this seriously.",
      'Not even close..',
      'Nope',
      'NYAAAAAAAAAAAAAAAAAAAKAKAKAKAKaAaaahh AHAHAHAAAAA NYAAAK, that was laughable!! NYAAAKAKAAA',
      'Have you tried ... was it a heart and water or.. no a heart and some blood?',
      "One time I used silver to create Liquid Light, you'll get there",
      'Remember the Brew of Beginnings? With small bones and water, most ingredients are only used in one potion!',
      'I hear certain witches find ashwinder eggs romantic... NYAAAK, daft old cooks!',
      "Once I wanted my dreams to speak to me, so I made a screaming potion!! But then I couldn't sleep!!"
    ]
  end

  def upgrade(player_name)
    "\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.magenta} Congrats #{player_name}#{','.magenta} you#{"\'".magenta}re now worthy of being called a true witch#{"!!!".magenta.blink}\n
    As such#{','.magenta} I will give you my first cauldron that my mentor gave to me#{'.'.magenta}\n
    As she and I once parted with it#{','.magenta} so will you in time#{'.'.magenta}\n
    When you find a worthy pupil#{'.'.magenta}#{'.'.magenta}#{'.'.magenta} who#{"\'".magenta}s not a useless dingbat#{'.'.magenta}"
  end

  def first_ingredient
    puts 'First ingredient?'.light_magenta
  end

  def second_ingredient
    puts 'Second ingredient?'.light_magenta
  end

  def third_ingredient
    puts 'Final ingredient?'.light_magenta
  end

  def duplicate_ingredients
    puts ''
    puts 'Pʟᴇᴀsᴇ sᴇʟᴇᴄᴛ ᴀ ᴠᴀʟɪᴅ ᴏᴘᴛɪᴏɴ'.light_red
    puts '(You used the same ingredient twice.)'.light_black
    sleep(2)
  end

  def menu_options
    puts @title_art.light_magenta.blink
    puts ''
    puts " Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ #{'?'.light_magenta}"
    puts ''
    sleep(0.05)
    puts " 𝟙 #{'-'.light_magenta} ℂ𝕣𝕖𝕒𝕥𝕖"
    puts ''
    sleep(0.05)
    puts " 𝟚 #{'-'.light_magenta} 𝕀𝕟𝕘𝕣𝕖𝕕𝕚𝕖𝕟𝕥𝕤"
    puts ''
    sleep(0.05)
    puts " 𝟛 #{'-'.light_magenta} ℝ𝕖𝕔𝕚𝕡𝕖"
    puts ''
    sleep(0.05)
    puts " 𝟡 #{'-'.light_magenta} #{'𝔹𝕒𝕔𝕜'.light_red}"
    puts ''
    sleep(0.05)
  end

  def simple_or_complex
    puts @title_art.light_magenta.blink
    puts ''
    puts " Dᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴍᴀᴋɪɴɢ ᴀ sɪᴍᴘʟᴇ ᴏʀ ᴄᴏᴍᴘʟᴇx ᴘᴏᴛɪᴏɴ #{'?'.light_magenta}"
    puts ''
    sleep(0.05)
    puts " 𝟙 #{'-'.light_magenta} 𝕊𝕚𝕄𝕡𝕝𝕖"
    puts ''
    sleep(0.05)
    puts " 𝟚 #{'-'.light_magenta} ℂ𝕠𝕄𝕡𝕝𝕖𝕩"
    puts ''
  end

  def current_equipment(ladle, cauldron)
    puts ' Cᴜʀʀᴇɴᴛ ᴇqᴜɪᴘᴍᴇɴᴛ:'.light_black
    sleep(0.05)
    puts " ʟᴀᴅʟᴇ: #{ladle.magenta}"
    sleep(0.05)
    puts " ᴄᴀᴜʟᴅʀᴏɴ: #{cauldron.magenta}"
    sleep(0.05)
    puts ''
    puts ''
  end

  def invalid_option
    puts ''
    puts "Pʟᴇᴀsᴇ sᴇʟᴇᴄᴛ ᴀ ᴠᴀʟɪᴅ ᴏᴘᴛɪᴏɴ".light_red
    sleep(0.8)
  end

  def quick_view_ingredients(ingredients)
    puts 'Iɴɢʀᴇᴅɪᴇɴᴛs:'.magenta
    puts ''
    sleep(0.5)
    ingredients.each_with_index do |ingredient, index|
      puts "#{index + 1} #{'-'.light_magenta} #{ingredient}"
      sleep(0.025)
    end
    puts ''
    puts 'end'.light_red
    puts ''
  end

  def quick_view_potions_as_ingredients(potions)
    puts "potions:".light_magenta
    puts ''
    sleep(0.5)
    potions.each_with_index do |potion, index|
      puts "#{index + 1} #{'-'.light_magenta} #{potion}"
      sleep(0.025)
    end
    puts ''
    puts 'end'.light_red
    puts ''
  end
end
