# require 'colorize'

class ExploreView
  attr_reader :title_art, :good_ingredient_text, :bad_ingredient_text

  def initialize
    @title_art = "
    ███████╗██╗░░██╗██████╗░██╗░░░░░░█████╗░██████╗░███████╗██╗
    ██╔════╝╚██╗██╔╝██╔══██╗██║░░░░░██╔══██╗██╔══██╗██╔════╝██║
    █████╗░░░╚███╔╝░██████╔╝██║░░░░░██║░░██║██████╔╝█████╗░░██║
    ██╔══╝░░░██╔██╗░██╔═══╝░██║░░░░░██║░░██║██╔══██╗██╔══╝░░╚═╝
    ███████╗██╔╝╚██╗██║░░░░░███████╗╚█████╔╝██║░░██║███████╗██╗
    ╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚══════╝░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝"
    # Array of things to say when a good ingredient is found
    @good_ingredient_text = [
      "Another stellar ingredient to add to my collection",
      "Keep that, we might need it later",
      "NYAAAKAKAAA that's what I'm talking about!",
      "Wow, that's a good find! I'm sure we can use this",
      "Oooh, not bad. We'll take this back",
      "Hmmm, I think I know what we can use this for... Let's grab it",
      "We definitely need this",
      "Finders keepers!"
    ]
    # Array of things to say when a good ingredient is found
    @bad_ingredient_text = [
      "Quit wasting time and find me something useful.",
      "I can't imagine what anyone would do with this?",
      "Oh hell no, we don't need that!",
      "Umm.... I think it's safe to say we don't need this",
      "Eww, no. Put it back",
      "I have too many of these already, no thanks",
      "Wow, that's a good find! Too bad it's not useful for potions.",
      "Throw that away now!"
    ]
  end

  def tutorial
    "Lᴇᴛ's ᴘʟᴀʏ sᴏᴍᴇ Bɪʟʟʏᴡɪɢ!!\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.green} I'm assuming you've played before? I believe it's similar to what the muggles refer to as 'black jack'.\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.green} But there's a twist...NYAAAAKAKAKAAA!!!\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.green} There's 1 card that's worth 21 all by itself!! I'll let you discover the other differences while playing.\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.green} I wish you all the worst luck, now Lets. Play. Some. BILLYWIIIIIIG!\n"
  end

  def read_damaged_recipe
    puts ""
    puts "#{" Kᴀᴢ's Jᴏᴜʀɴᴀʟ:".green}\n #{"Year:".green} 1743\n #{"Moon:".green} Garnet\n\n#{" It reads:".green}"
    puts "  ℐ'𝓋ℯ 𝒶𝓁𝓂ℴ𝓈𝓉 𝒻𝒾ℊ𝓊𝓇ℯ𝒹 𝒾𝓉 ℴ𝓊𝓉... 𝓉𝒽ℯ 𝒱𝒾𝓁ℯ ℴ𝒻 𝒜𝓂ℴ𝓇𝓉ℯ𝓃𝓉𝒾𝒶.                ".black.on_light_yellow
    puts "  ℐ'𝓋ℯ 𝓉𝓇𝒾ℯ𝒹 𝒶𝓃𝒹 𝒻𝒶𝒾𝓁ℯ𝒹 𝓈ℴ 𝓂𝒶𝓃𝓎 𝓉𝒾𝓂ℯ𝓈, 𝒷𝓊𝓉 𝓉𝒽𝒾𝓈 𝓂ℴℴ𝓃 𝓌𝒾𝓁𝓁 𝒷ℯ 𝒹𝒾𝒻𝒻ℯ𝓇ℯ𝓃𝓉.".black.on_light_yellow
    puts "  ℐ'𝓋ℯ 𝒹𝒾𝓈𝒸ℴ𝓋ℯ𝓇ℯ𝒹 𝓉𝒽𝒶𝓉 𝓉𝒽ℯ 𝓀ℯ𝓎 𝒾𝓃ℊ𝓇ℯ𝒹𝒾ℯ𝓃𝓉𝓈 𝒶𝓇ℯ 𝒶𝒸𝓉𝓊𝒶𝓁𝓁𝓎 𝓅ℴ𝓉𝒾ℴ𝓃𝓈!!.     ".black.on_light_yellow
    puts "  ℐ𝓃 𝒻𝒶𝒸𝓉 𝒶𝓁𝓁 𝓉𝒽ℯ 𝒾𝓃ℊ𝓇ℯ𝒹𝒾ℯ𝓃𝓉𝓈 𝒶𝓇ℯ 𝓅ℴ𝓉𝒾ℴ𝓃𝓈.                             ".black.on_light_yellow
    puts "  𝒯𝒽𝒾𝓈 𝒾𝓈 𝓂𝓎 𝒽𝓎𝓅ℴ𝓉𝒽ℯ𝓈𝒾𝓈, 𝒾𝒻 𝓎ℴ𝓊 𝒸ℴ𝓂𝒷𝒾𝓃ℯ 𝓉𝒽ℯ ℬ𝓇ℯ𝓌 ℴ𝒻 𝓋𝒾𝓈𝒾ℴ𝓃𝓈 𝓌-         ".black.on_light_yellow
    puts ""
    puts "--".light_black
    puts ""
    puts "Other findings:".green
    puts "damaged recipe: #{"Witch's Brew".green} => ['#{"cat hair".light_green}', 'b-'],"
    puts "damaged recipe: #{"Warlock's Brew".green} => ['#{"frog brain".light_green}', 't---u- -- d--']"
  end

  def quick_view_ingredients(ingredients)
    puts "Iɴɢʀᴇᴅɪᴇɴᴛs:".light_green
    puts ""
    sleep(0.25)
    ingredients.each_with_index do |ingredient, index|
      puts "#{index + 1} #{"-".light_green} #{ingredient}"
      sleep(0.05)
    end
    puts ""
    puts "ᴇɴᴅ".light_red
    puts ""
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
    puts title_art.light_green.blink
    puts ""
    puts " Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ #{'?'.light_green}"
    puts ""
    sleep(0.05)
    puts " 𝟙 #{'-'.light_green} 𝕊𝕖𝕒𝕣𝕔𝕙"
    puts ""
    sleep(0.05)
    puts " 𝟚 #{'-'.light_green} 𝕀𝕟𝕘𝕣𝕖𝕕𝕚𝕖𝕟𝕥𝕤"
    puts ""
    sleep(0.05)
    puts " 𝟛 #{'-'.light_green} 𝕋𝕦𝕥𝕠𝕣𝕚𝕒𝕝"
    puts ""
    sleep(0.05)
    puts " 𝟡 #{'-'.light_green} #{'𝔹𝕒𝕔𝕜'.light_red}"
    puts ""
    sleep(0.05)
    puts ""
  end

  # Text displayed to prompt search again
  def search_again_text
    puts @title_art.light_green.blink
    puts ""
    puts "Wᴇ'ʟʟ ᴋᴇᴇᴘ sᴇᴀʀᴄʜɪɴɢ ᴜɴᴛɪʟ ʏᴏᴜ ᴀsᴋ ᴍᴇ ᴛᴏ sᴛᴏᴘ#{'!'.light_green}"
    puts ""
    puts "𝟡 #{'-'.light_green} #{'𝕤𝕥𝕠𝕡'.light_red}"
    puts ""
    puts "Eɴᴛᴇʀ ᴀɴʏ ᴋᴇʏ ᴛᴏ ᴄᴏɴᴛɪɴᴜᴇ".light_black
  end

  # Text displayed birefly when an invalid option is entered.
  def invalid_option
    puts @title_art.light_green.blink
    puts ""
    puts "Pʟᴇᴀsᴇ sᴇʟᴇᴄᴛ ᴀ ᴠᴀʟɪᴅ ᴏᴘᴛɪᴏɴ".light_red
    sleep(0.75)
  end
end
