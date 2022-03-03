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
          "Wow, that's a good fine! Too bad it's not useful for potions.",
          "Throw that away now!"
      ]
  end

  def quick_view_ingredients(ingredients)
      puts "Iɴɢʀᴇᴅɪᴇɴᴛs:".light_yellow
      puts ""
      sleep(0.5)
      ingredients.each do |ingredient|
        puts "- #{ingredient}"
        sleep(0.05)
      end
      puts ""
      puts "ᴇɴᴅ".light_red
      puts ""
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
      puts " 𝟡 #{'-'.light_green} #{'𝔹𝕒𝕔𝕜'.light_red}"
      puts ""
      sleep(0.05)
      puts ""
    end
  
  # Text displayed to prompt search again
  def search_again_text
      puts @title_art.light_green.blink
      puts "Wᴏᴜʟᴅ ʏᴏᴜ ʟɪᴋᴇ ᴛᴏ ᴄᴏɴᴛɪɴᴜᴇ sᴇᴀʀᴄʜɪɴɢ #{'?'.light_green}"
      puts ""
      puts "𝟙 #{'-'.light_green} 𝕪𝕖𝕤"
      puts ""
      puts "𝟡 #{'-'.light_green} #{'𝔹𝕒𝕔𝕜'.light_red}"
      puts ""
      puts ""
  end

  # Text displayed birefly when an invalid option is entered.
  def invalid_option
    puts @title_art.light_green.blink
    puts ""
    puts "Pʟᴇᴀsᴇ sᴇʟᴇᴄᴛ ᴀ ᴠᴀʟɪᴅ ᴏᴘᴛɪᴏɴ".light_red
    sleep(0.75)
  end
end