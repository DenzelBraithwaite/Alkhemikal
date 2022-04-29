class ShopView < MainView
  attr_accessor :hats, :robes, :ingredients, :potions, :advice, :tips, :visited, :good_explore_ingredients

  def initialize
    @title_art = "
    ░██████╗██╗░░██╗░█████╗░██████╗░
    ██╔════╝██║░░██║██╔══██╗██╔══██╗
    ╚█████╗░███████║██║░░██║██████╔╝
    ░╚═══██╗██╔══██║██║░░██║██╔═══╝░
    ██████╔╝██║░░██║╚█████╔╝██║░░░░░
    ╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░"
    # Array of good ingredients found while exploring
    @good_explore_ingredients = [
      'a chess pawn',
      'a chimera tail',
      'a crocodile heart',
      'a dragon claw',
      'a fairy wing',
      "a griffin's beak",
      'a harpy egg',
      'a mandrake',
      'a merge-dragon egg',
      'a moonstone',
      'a wyvern ear',
      'aconite',
      'an ogre toenail',
      'an owl feather',
      'ancient dust',
      'arcana rocks',
      'ashwinder eggs',
      'assorted eyeballs',
      'bat spleen',
      'cat hair',
      'centaur arteries',
      'cyclops sweat',
      'frog brains',
      'gargoyle scales',
      'ghost essence',
      'ginger',
      'goblin gums',
      'gorgon tears',
      'iguana blood',
      'ink',
      'lavender',
      'leech juice',
      'mermaid scales',
      'mushrooms',
      'newt oil',
      'octopus powder',
      'pickled slugs',
      'pixie wings',
      'rose petals',
      'rubies',
      'sage',
      'silver',
      'siren vocal cords',
      'small bones',
      'star grass',
      'tarot cards',
      'toadstools',
      'tongue of dog',
      'unicorn urine',
      'werewolf fur',
      "wizard's beard hairs",
      'wormwood'
    ]
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
      "bottled tink": 1, # Bad ingredient
      "dirt": 8, # Bad ingredient
      "bubbly bubly": 15, # Bad ingredient
      "tapioca balls": 18, # Bad ingredient
      "a chess pawn": 20, # Good ingredient, can be found while searching
      "crinkled leaves": 32, # Bad ingredient
      "air freshner": 48, # Bad ingredient
      "cat saliva": 56, # Bad ingredient
      "various spices": 80, # Bad ingredient
      "goron seasoning": 105, # Bad ingredient
      "tarot cards": 111, # Good ingredient, can be found while searching
      "a merge-dragon egg": 210 # Mobile madness
    }
    @potions = {
      "fahkay poshun": 508, # Bad potion
      "realimus-totalis": 699, # Bad potion
      "skaahm": 715, # Bad potion
      "authentic clear fog": 888, # Bad potion
      "wayee stamuhnee": 999 # Gives bonus 2000G
    }
    @advice = {
      "Inventory": 10, # All customization is done inside of your Inventory, including your name.
      "Easter egg": 26, # There's a hidden easter egg in one of the menus.
      "Explore": 40, # When you've found every ingredient while exploring, you'll get a free hint on how to create the final potion.
      "Billywig": 50, # The odds of Billywig are against you, but if you manage to get 21, you can a nice profit.
      "Shop": 100, # If I had to make a recommendation, hmm... I'd say buy my most expensive potion!! AHIII ha ha haaa...
      "Cheat codes": 101, # You can change your name for secret hidden loot, try changing your name to 'Witch' for example.
      "Simple potion": 120, # One ingredient in shop + one ingredient in the maze = M.M.
      "Labyrinth tip": 150, # The south west and north east are dangerous, make sure to keep moving, if you stand still you'll die.
      "Labyrinth tip 2": 300, # If you feel like you're in a dangerous area, leave the labyrinth and come back to save your gold.
      "Complex potion": 500, # None of the ingredients in the potion potion are used in another potion.
      "Labyrinth tip 3": 1000, # Use the keyword 'info' in the labyrinth to get more info on your location.
      "Final potion": 10_000, # "Vile vial of amortentia": ['Bowl of smoke and embers', 'Mobile madness', 'Time potion']
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
      "Not all tips are useful, most of them are, but this one isn't.",
      "Don't think the shop revolves around you, if you buy the same item twice, you'll have two of the same item",
      "The shopkeeper doesn't only stock up for you ya know? If you want more than one of something, go ahead!"
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
  def shop_menu_options(hat, robe, gold, enter_shop)
    print "Tɪᴘ: ".blue
    puts @tips.sample
    puts ''
    puts title_art.blue.blink
    puts ''
    puts "Shopkeeper#{'> '.blue} #{greet_player(enter_shop)}"
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
    current_clothing(hat, robe, gold)
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

  # List all hats for sale
  def display_hats
    puts "#{'Tip:'.blue} Enter the price of the hat you'd like to buy#{",".blue} press #{"'".blue}#{'9'.light_red}#{"'".blue} to go back#{'.'.blue}"
    puts ''
    puts @title_art.blue.blink
    puts ''
    puts ''
    @hats.each do |hat, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{hat}"
      puts ''
    end
    puts ''
  end

  # List all robes for sale
  def display_robes
    puts "#{'Tip:'.blue} Enter the price of the robe you you'd like to buy#{",".blue} press #{"'".blue}#{'9'.light_red}#{"'".blue} to go back#{'.'.blue}"
    puts ''
    puts @title_art.blue.blink
    puts ''
    puts ''
    @robes.each do |robe, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{robe}"
      puts ''
    end
    puts ''
  end

  # List all ingredients for sale
  def display_ingredients
    puts "#{'Tip:'.blue} Enter the price of the ingredient you'd like to buy#{",".blue} press #{"'".blue}#{'9'.light_red}#{"'".blue} to go back#{'.'.blue}"
    puts ''
    puts @title_art.blue.blink
    puts ''
    puts ''
    @ingredients.each do |ingredient, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{ingredient}"
      puts ''
    end
    puts ''
  end

  # List all potions for sale
  def display_potions
    puts "#{'Tip:'.blue} Enter the price of the potion you'd like to buy#{",".blue} press #{"'".blue}#{'9'.light_red}#{"'".blue} to go back#{'.'.blue}"
    puts ''
    puts @title_art.blue.blink
    puts ''
    puts ''
    @potions.each do |potion, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{potion}"
      puts ''
    end
    puts ''
  end

  # List all advice for sale
  def display_advice
    puts "#{'Tip:'.blue} Enter the price for the piece of advice you'd like to hear#{",".blue} press #{"'".blue}#{'9'.light_red}#{"'".blue} to go back#{'.'.blue}"
    puts ''
    puts @title_art.blue.blink
    puts ''
    puts ''
    @advice.each do |piece_of_advice, price|
      puts "#{price.to_s.yellow}#{'G'.yellow}#{' - '.blue}#{piece_of_advice}"
      puts ''
    end
    puts ''
  end

  # Confirms before player purchases item.
  def confirm_purchase(item_key, item_value, player_name)
    system('clear')
    puts @title_art.blue.blink
    puts ''
    puts "Shopkeeper #{'>'.blue} #{item_key.to_s.light_blue} for #{item_value.to_s.yellow}#{'G'.yellow}, are you sure #{'?'.blue}"
    puts ''
    puts '1 - yes'
    puts ''
    puts '2 - no'
    puts ''
    print "#{player_name}#{'>'.blue} "
    confirm = gets.chomp.to_i
    case confirm
    when 1 then return true
    when 2 then return false
    end
  end

  def current_clothing(hat, robe, gold)
    puts " Cᴜʀʀᴇɴᴛ ᴇqᴜɪᴘᴍᴇɴᴛ:".light_black
    sleep(0.05)
    puts " Hᴀᴛ: #{hat.blue}"
    sleep(0.05)
    puts " Rᴏʙᴇ: #{robe.blue}"
    sleep(0.05)
    puts " Gᴏʟᴅ: #{gold.to_s.yellow}#{'G'.yellow}"
    sleep(0.05)
    puts ''
    puts ''
  end

  def insufficient_funds
    puts ''
    puts "Shopkeeper #{'>'.blue} If don't have any gold then get out#{'!'.blue}"
    puts "Insufficient funds".light_red.blink
    puts ''
  end

  def invalid_option
    puts @title_art.blue.blink
    puts ''
    puts "Please select a valid option".light_red
    sleep(0.8)
  end
end
