# require 'colorize'

class ExploreView
  attr_reader :title_art, :good_ingredient_text, :bad_ingredient_text, :perfect_search_alert_one, :perfect_search_alert_two

  def initialize
    @title_art = "
    ███████╗██╗░░██╗██████╗░██╗░░░░░░█████╗░██████╗░███████╗██╗
    ██╔════╝╚██╗██╔╝██╔══██╗██║░░░░░██╔══██╗██╔══██╗██╔════╝██║
    █████╗░░░╚███╔╝░██████╔╝██║░░░░░██║░░██║██████╔╝█████╗░░██║
    ██╔══╝░░░██╔██╗░██╔═══╝░██║░░░░░██║░░██║██╔══██╗██╔══╝░░╚═╝
    ███████╗██╔╝╚██╗██║░░░░░███████╗╚█████╔╝██║░░██║███████╗██╗
    ╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚══════╝░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝"
    @tips = [
      "Keep pressing #{"'".light_green}enter#{"'".light_green} in a menu to cycle through the tips #{'/'.light_green} hints#{'.'.light_green}",
      "Every time you explore#{','.light_green} you have a chance to find 1#{'-'.light_green}3 ingredients#{'.'.light_green}",
      "When you#{"'".light_green}ve found all of the ingredients#{','.light_green} you#{"'".light_green}ll be able to view any damaged recipes you#{"'".light_green}ve collected#{'.'.light_green}",
      "You can press enter a few times in a row to continue searching for a few rounds at a time#{'.'.light_green}",
      "You can check the good ingredients you#{"'".light_green}ve found by looking at your ingredients from the menu#{'.'.light_green}",
      'Every time you search, you find a bit of gold too. You can use that gold down at the shop.',
      "If you get a perfect explore run, you'll earn yourself some extra gold.",
      'Almost every ingredient can be found while exploring... Almost.',
      'Unfortunately, Gruntilda always seems to join you when you search for ingredients.',
      "Not all tips are useful, most of them are, but this one isn't.",
      "It might be tempting to repeatedly press the enter key, but you might miss something important if you do that...",
      "Out of all of the tips in this game, one of them is a blatant lie. One of them... Not this one though, this one is for sure an honest true tip. You're welcome.",
      "There's nothing like exploring the great out doors, but don't get carried away. It might be overwhelming if you collect too much at once.",
      "You want to get a good amount of ingredients before you start brewing potions, roughly 26 to start I'd say.",
      "You want to get a good amount of ingredients before you start brewing potions, about 27 should do. Or was it 26? Wait, yes 26, sorry about that."

    ]
    # Array of things to say when a good ingredient is found
    @good_ingredient_text = [
      'Another stellar ingredient to add to my collection.',
      'Keep that, we might need it later.',
      "NYAAAKAKAAA that's what I'm talking about!",
      "Wow, that's a good find! I'm sure we can use this.",
      "Oooh, not bad. We'll take this back.",
      "Hmmm, I think I know what we can use this for... Let's grab it.",
      'We definitely need this.',
      'Finders keepers!',
      "I can't believe you found that laying around, nyak!",
      'Quick, grab that!',
      "That's great for making potions, grab that.",
      'You know what, I think we can use that.',
      "Now that's what I'm talking about.",
      "Ooohh lala, now that we can use.",
      "I knew I should've looked there earlier...",
      "Don't get ahead of yourself, you got lucky on that find.",
      "Not bad... not bad at all witch.",
      "Hmph, I could've found that if you weren't in my way.",
      "Nyaaak! I've been looking for one of those."
    ]
    # Array of things to say when a good ingredient is found
    @bad_ingredient_text = [
      'Quit wasting time and find me something useful.',
      "I can't imagine what anyone would do with this?",
      "Oh hell no, we don't need that!",
      "Umm.... I think it's safe to say we don't need this",
      'Eww, no. Put it back',
      'I have too many of these already, no thanks',
      "Wow, that's a good find! Too bad it's not useful for potions.",
      'Throw that away now!',
      "NYAAAKAKAKAaa- Oh, you're serious? No, put that back.",
      'We could use that in a hexing potion, but better to leave that for now',
      "Well I've never seen that used before, so maybe leave it where it is",
      'Did that just move? Nope nope nope, put that back!',
      "Hmm, maybe if it was in better condition, but nah let's leave that here",
      'Sometimes I wonder why I even bother with you...',
      "Wow, maybe you aren't cut out to be a witch after all?",
      'Why would you even think we could use that?',
      "... Hmmm? Oh you actually think we can use that?",
      "Stupid, just stupid. Throw that away now, silly witch.",
      "Do you really have this much time to waste?",
      "It's witches like you that give us a bad name, try again!",
      "Do you even have the faintest clue as to what we're looking for?",
      "NYAAAkakaak ka ka kaaaaa.... How many times are you going to joke around?"
    ]
    @perfect_search_alert_one = "PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  "
    @perfect_search_alert_two = "PERFECT SEARCH!!                        PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                      PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  PERFECT SEARCH!!                                                  "

  end

  def tutorial
    "Lᴇᴛ's explore!!\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.green} Exploring is very simple, you press enter to keep searching for ingredients until you're satisfied.\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.green} The good ingredients will be kept, and the bad ones discarded.\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.green} Each ingredient is used to make a potion, so there's no time to wase, let's explore!!\n"
  end

  def read_damaged_recipe
    puts ''
    puts "#{" Kᴀᴢ's Jᴏᴜʀɴᴀʟ:".green}\n #{"Moon cycle:".green} 1743\n #{"Moon:".green} Garnet\n\n#{" It reads:".green}"
    puts "  ℐ'𝓋ℯ 𝒶𝓁𝓂ℴ𝓈𝓉 𝒻𝒾ℊ𝓊𝓇ℯ𝒹 𝒾𝓉 ℴ𝓊𝓉... 𝓉𝒽ℯ 𝒱𝒾𝓁ℯ ℴ𝒻 𝒜𝓂ℴ𝓇𝓉ℯ𝓃𝓉𝒾𝒶.                ".black.on_light_yellow
    puts "  ℐ'𝓋ℯ 𝓉𝓇𝒾ℯ𝒹 𝒶𝓃𝒹 𝒻𝒶𝒾𝓁ℯ𝒹 𝓈ℴ 𝓂𝒶𝓃𝓎 𝓉𝒾𝓂ℯ𝓈, 𝒷𝓊𝓉 𝓉𝒽𝒾𝓈 𝓂ℴℴ𝓃 𝓌𝒾𝓁𝓁 𝒷ℯ 𝒹𝒾𝒻𝒻ℯ𝓇ℯ𝓃𝓉.".black.on_light_yellow
    puts "  ℐ'𝓋ℯ 𝒹𝒾𝓈𝒸ℴ𝓋ℯ𝓇ℯ𝒹 𝓉𝒽𝒶𝓉 𝓉𝒽ℯ 𝓀ℯ𝓎 𝒾𝓃ℊ𝓇ℯ𝒹𝒾ℯ𝓃𝓉𝓈 𝒶𝓇ℯ 𝒶𝒸𝓉𝓊𝒶𝓁𝓁𝓎 𝓅ℴ𝓉𝒾ℴ𝓃𝓈!!.     ".black.on_light_yellow
    puts '  ℐ𝓃 𝒻𝒶𝒸𝓉 𝒶𝓁𝓁 𝓉𝒽ℯ 𝒾𝓃ℊ𝓇ℯ𝒹𝒾ℯ𝓃𝓉𝓈 𝒶𝓇ℯ 𝓅ℴ𝓉𝒾ℴ𝓃𝓈.                             '.black.on_light_yellow
    puts '  𝒯𝒽𝒾𝓈 𝒾𝓈 𝓂𝓎 𝒽𝓎𝓅ℴ𝓉𝒽ℯ𝓈𝒾𝓈, 𝒾𝒻 𝓎ℴ𝓊 𝒸ℴ𝓂𝒷𝒾𝓃ℯ 𝓉𝒽ℯ 𝓉𝒾𝓂ℯ 𝓅ℴ𝓉𝒾ℴ𝓃 𝓌𝒾-         '.black.on_light_yellow
    puts ''
    puts '--'.light_black
    puts ''
    puts 'Other findings:'.green
    puts "damaged recipe: #{"Witch's Brew".green} => ['#{"cat hair".light_green}', 'b-'],"
    puts "damaged recipe: #{"Warlock's Brew".green} => ['#{"frog brain".light_green}', 't---u- -- d--']"
  end

  def quick_view_ingredients(ingredients)
    puts "Iɴɢʀᴇᴅɪᴇɴᴛs:".light_green
    puts ''
    sleep(0.25)
    ingredients.each_with_index do |ingredient, index|
      puts "#{index + 1} #{"-".light_green} #{ingredient}"
      sleep(0.05)
    end
    puts ''
    puts "ᴇɴᴅ".light_red
    puts ''
  end

  # When multiple ingredients are found
  def multiple_ingredients_found_text(ingredients_found)
    puts "You found#{':'.green}\n"
    sleep(0.75)
    ingredients_found.each { |ingredient| puts "#{'-'.green} #{ingredient}"}
    puts ''
  end

  def how_many_good_ingredients_found(number_of_good_ingredients, number_of_ingredients_found)
    case number_of_good_ingredients
    # Change these to sample more text
    when 0
      if number_of_ingredients_found == 2
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.green}Neither of these ingredients are useful you dingbat!"
      else
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.green}NYAAK, all of your ingredients suck! Do you know what you're looking for?"
      end
    when 1
      if number_of_ingredients_found == 2
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.green}One of these we can use, throw the other away."
      else
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.green}one of your ingredients is good, the rest suck..."
      end
    when 2
      if number_of_ingredients_found == 2
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.green}Not bad, these two ingredients will work well..."
      else
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.green}Well I can't use one of these, but the other 2 should be good"
      end
    when 3 then puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.green}A witch in her prime! These are all fantastic for potion making."
    end
  end

  def explore_menu_options
    print 'Tip: '.light_green
    puts @tips.sample
    puts ''
    puts title_art.light_green.blink
    puts ''
    puts " Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ #{'?'.light_green}"
    puts ''
    sleep(0.05)
    puts " 𝟙 #{'-'.light_green} 𝕊𝕖𝕒𝕣𝕔𝕙"
    puts ''
    sleep(0.05)
    puts " 𝟚 #{'-'.light_green} 𝕀𝕟𝕘𝕣𝕖𝕕𝕚𝕖𝕟𝕥𝕤"
    puts ''
    sleep(0.05)
    puts " 𝟛 #{'-'.light_green} 𝕋𝕦𝕥𝕠𝕣𝕚𝕒𝕝"
    puts ''
    sleep(0.05)
    puts " 𝟡 #{'-'.light_green} #{'𝔹𝕒𝕔𝕜'.light_red}"
    puts ''
    sleep(0.05)
    puts ''
  end

  # Text displayed to prompt search again
  def search_again_text
    puts @title_art.light_green.blink
    puts ''
    puts "Wᴇ'ʟʟ ᴋᴇᴇᴘ sᴇᴀʀᴄʜɪɴɢ ᴜɴᴛɪʟ ʏᴏᴜ ᴀsᴋ ᴍᴇ ᴛᴏ sᴛᴏᴘ#{'!'.light_green}"
    puts ''
    puts "𝟡 #{'-'.light_green} #{'𝕤𝕥𝕠𝕡'.light_red}"
    puts ''
    puts "Eɴᴛᴇʀ ᴀɴʏ ᴋᴇʏ ᴛᴏ ᴄᴏɴᴛɪɴᴜᴇ".light_black
  end

  # Text displayed birefly when an invalid option is entered.
  def invalid_option
    puts @title_art.light_green.blink
    puts ''
    puts "Pʟᴇᴀsᴇ sᴇʟᴇᴄᴛ ᴀ ᴠᴀʟɪᴅ ᴏᴘᴛɪᴏɴ".light_red
    sleep(0.75)
  end
end
