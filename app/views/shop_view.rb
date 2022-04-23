class ShopView < MainView
  attr_accessor :hats, :robes, :ingredients, :potions, :advice, :tips

  def initialize
    @title_art = "
    ░██████╗██╗░░██╗░█████╗░██████╗░
    ██╔════╝██║░░██║██╔══██╗██╔══██╗
    ╚█████╗░███████║██║░░██║██████╔╝
    ░╚═══██╗██╔══██║██║░░██║██╔═══╝░
    ██████╔╝██║░░██║╚█████╔╝██║░░░░░
    ╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░"
    @witch_hat_art = '
              .
            /:\
            /;:.\
          //;:. \
          ///;:.. \
    __--"////;:... \"--__
    --__   "--_____--"__--
      ''"--_______--''"'
    @witch_robe_art = "
                  .--.
                ,-\"  \"-,
                /|\\____/|\\
              / \\__  __/ \\
              './ \\    / \\.'
                  )  (
                  /    \\
                ;      ;
                |      |
                |      |
                |______|"
    @hats = {
      "paper bag": 5,
      "red boarding helmet": 80,
      "mini witch hat": 120,
      "reversible octopus plushie": 150,
      "unicorn headband": 200
    }
    @robes = {
      "art smock": 20,
      "Knock-offacado onesie": 99,
      "nun habit": 113,
      "halloween romper": 166,
      "disney princess dress": 240
    }
    @ingredients = {
      "bottled tink": 0,
      "dirt": 5,
      "bubbly bubly": 10,
      "tapioca balls": 18,
      "cat saliva": 28,
      "crinkled leaves": 30,
      "various spices": 40,
      "goron seasoning": 87,
      "air freshner": 111,
      "merge-dragon egg": 120 # Mobile madness
    }
    @potions = {
      "fahkay poshun": 508,
      "realimus-totalis": 699,
      "skaahm": 715,
      "authentic clear fog": 888,
      "wayee stamuhnee": 999,
    }
    @advice = {
      "billywig": 50, # You make money off of billywig, 3* your amount if you win, 0 if you even.
      "potion": 715, # make a few of these that show how to make a potion
      "potion": 715, # make a few of these that show how to make a potion
      "potion": 715, # make a few of these that show how to make a potion
      "potion": 715, # make a few of these that show how to make a potion
      "potion": 715, # make a few of these that show how to make a potion
      "potion": 715, # make a few of these that show how to make a potion
      "labyrinth tip": 100, # something about regions
      "Labyrinth tip 2": 200, # info keyword cheat
      "Final potion": 3000, # how to make it
    }
    @tips =[
      "Keep pressing #{"'".cyan}enter#{"'".cyan} in a menu to cycle through the tips #{'/'.blue} hints#{'.'.cyan}",
      "Some of the items you buy here are completely useless",
      "Watch out, not everything you buy is good.",
      "Buying advice can be helpful when you're stuck.",
      "The shop was the final addition to the game.",
      "There's an authentic one-of-a-kind avocado oneside, but you can't buy it here.",
      "Most things you do will earn you gold, so don't be afraid to spend a little",
    ]
  end

  # Shop main menu options
  def shop_menu_options(gold)
    print "Tɪᴘ: ".blue
    puts @tips.sample
    puts ''
    puts title_art.blue.blink
    puts ''
    puts " Welcome#{','.blue} what can I do ya for #{'?'.blue}"
    puts ''
    sleep(0.05)
    puts " 𝟙 #{'-'.blue} ℍ𝕒𝕥𝕤"
    puts ''
    sleep(0.05)
    puts " 𝟚 #{'-'.blue} ℝ𝕠𝕓𝕖𝕤"
    puts ''
    sleep(0.05)
    puts " 𝟛 #{'-'.blue} 𝕀𝕟𝕘𝕣𝕖𝕕𝕚𝕖𝕟𝕥𝕤"
    puts ''
    sleep(0.05)
    puts " 𝟜 #{'-'.blue} ℙ𝕠𝕥𝕚𝕠𝕟𝕤"
    puts ''
    sleep(0.05)
    puts " 𝟝 #{'-'.blue} 𝔸𝕕𝕧𝕚𝕔𝕖"
    puts ''
    sleep(0.05)
    puts " 𝟡 #{'-'.blue} #{'𝔹𝕒𝕔𝕜'.light_red}"
    puts ''
    sleep(0.05)
    puts "Current gold#{':'.blue} #{gold.to_s.yellow}#{'G'.yellow}"
    puts ''
  end

  # Shop category options
  def shop_category(category)
    puts title_art.blue.blink
    puts ''
    puts " Ahh#{','.blue} a nice #{category}. Which one catches your eye #{'?'.blue}"
    puts ''
  end

  # List all hats for sale
  def display_hats(hats)
    puts @title_art.blue.blink
    puts ''
    hats.each do |hat, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{hat}"
      puts ''
    end
    puts ''
  end

  # List all robes for sale
  def display_robes(robes)
    puts @title_art.blue.blink
    puts ''
    robes.each do |robe, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{robe}"
      puts ''
    end
    puts ''
  end

  # List all ingredients for sale
  def display_ingredients(ingredients)
    puts @title_art.blue.blink
    puts ''
    ingredients.each do |ingredient, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{ingredient}"
      puts ''
    end
    puts ''
  end

  # List all potions for sale
  def display_potions(potions)
    puts @title_art.blue.blink
    puts ''
    potions.each do |potion, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{potion}"
      puts ''
    end
    puts ''
  end

  # List all advice for sale
  def display_advice(advice)
    puts @title_art.blue.blink
    puts ''
    advice.each do |piece_of_advice, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{piece_of_advice}"
      puts ''
    end
    puts ''
  end

  def invalid_option
    puts @title_art.blue.blink
    puts ''
    puts "Please select a valid option".light_red
    sleep(0.8)
  end
end
