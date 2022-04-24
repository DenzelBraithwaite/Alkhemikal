class ShopView < MainView
  attr_accessor :hats, :robes, :ingredients, :potions, :advice, :tips, :visited

  def initialize
    @title_art = "
    ░██████╗██╗░░██╗░█████╗░██████╗░
    ██╔════╝██║░░██║██╔══██╗██╔══██╗
    ╚█████╗░███████║██║░░██║██████╔╝
    ░╚═══██╗██╔══██║██║░░██║██╔═══╝░
    ██████╔╝██║░░██║╚█████╔╝██║░░░░░
    ╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░"
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
      "bottled tink": 0, # Bad ingredient
      "dirt": 5, # Bad ingredient
      "bubbly bubly": 10, # Bad ingredient
      "tapioca balls": 18, # Bad ingredient
      "cat saliva": 28, # Bad ingredient
      "crinkled leaves": 30,
      "various spices": 40,
      "goron seasoning": 87,
      "air freshner": 111,
      "merge-dragon egg": 120 # Mobile madness
    }
    @potions = {
      "fahkay poshun": 508, # Bad potion
      "realimus-totalis": 699, # Bad potion
      "skaahm": 715, # Bad potion
      "authentic clear fog": 888, # Bad potion
      "wayee stamuhnee": 999 # Gives bonus 2000G
    }
    @advice = {
      "Inventory": 0, # If you don't want to share your name, you can change it and leave it blank.
      "Explore": 40, # When you're done exploring, you'll get a free hint on how to create the final potion.
      "Billywig": 50, # You make money off of billywig, 2* your amount if you win, 0 if you go even.
      "Shop": 300, # If I had to make a recommendation, hmm... I'd say buy my most expensive potion!! AHIII ha ha haaa...
      "Labyrinth tip": 150, # The south west and north east are the most dangerous regions
      "Labyrinth tip 2": 2000, # info keyword cheat
      "Complex potion": 800, # None of the ingredients in the potion potion are used in another potion.
      "Final potion": 10_000, # "Vile vial of amortentia": ['Bowl of smoke and embers', 'Mobile madness', 'Time potion']
      "Easter Egg": 26 # There's a hidden easter in one of the menus
    }
    @tips = [
      "Keep pressing #{"'".cyan}enter#{"'".cyan} in a menu to cycle through the tips #{'/'.blue} hints#{'.'.cyan}",
      'Some of the items you buy here are completely useless, beware.',
      "Watch out, not everything you buy is useful, but that doesn't mean you won't find something you like.",
      "Buying advice can be helpful when you're stuck.",
      'The shop was the final addition to the game, it tied everything together!',
      "There's an authentic one-of-a-kind avocado oneside, but you can't buy it here.",
      "Most things you do will earn you gold, so don't be afraid to spend a little",
      'I hear bad things about the potions here, probably better to make your own with Gruntilda.',
      "For some reason, the shopkeeper always refers to Gruntilda as 'Glinda', strange right?",
      'Advice pays, if you feel stuck, consider talking to the shopkeeper',
      "Not all tips are useful, most of them are, but this one isn't."
    ]
    @visited = false
    @greetings = [
      'Welcome back, stay for as long as you need.',
      "Ahh, if it isn't Glinda's new star pupil, welcome back.",
      'Back for more eh?',
      'Finest loot for the finest prices, no refunds.',
      'What is it? Need something?',
      'All store prices are final and non-negotiable, got it?',
      "Oh, it's you again. What can I do ya for?",
      "So you've returned, I'm not surprised. My deals are the best in town!",
      '*whistles*'.light_black,
    ]
  end

  # Shop main menu options
  def shop_menu_options(gold, enter_shop)
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
    puts "Shopkeeper#{'> '.blue} #{greet_player(enter_shop)}"
    puts ''
    sleep(0.05)
    puts "Current gold#{':'.blue} #{gold.to_s.yellow}#{'G'.yellow}"
    puts ''
  end

  # Greets player differently only if he just walked in
  def greet_player(just_entered_shop)
    just_entered_shop ? new_to_shop_or_not : @current_greeting
  end

  # Determines greeting, based on if player is new to the shop
  def new_to_shop_or_not
    if @visited
      @current_greeting = @greetings.sample
    else
      @current_greeting = "A new customer#{'!'.blue} Welcome welcome, please let me know if you see anything you'd like#{'!'.blue}"
    end
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

  def are_you_sure
    puts "Shopkeeper #{'>'.blue} Are you sure #{'?'.blue}"
    puts ''
  end

  def invalid_option
    puts @title_art.blue.blink
    puts ''
    puts "Please select a valid option".light_red
    sleep(0.8)
  end
end
