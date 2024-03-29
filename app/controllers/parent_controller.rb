class ParentController
  attr_accessor :player

  def initialize(player)
    @player = player
  end

# Save files
def save_game
  @gold = @player.gold
  @name = @player.name
  @ladle = @player.ladle
  @cauldron = @player.cauldron
  @hat = @player.current_hat
  @hats = @player.hats
  @robe = @player.current_robe
  @robes = @player.robes
  @ingredients = @player.ingredients
  @special_recipes = @player.special_recipes
  @recipes = @player.recipes
  @advice = @player.shopkeeper_advice
  main_save = File.join(__dir__, "../../data/main_save.csv")
  ingredients_save = File.join(__dir__, "../../data/ingredients_save.csv")
  # recipes_save = File.join(__dir__, "../../data/recipes_save.csv")
  # special_recipes_save = File.join(__dir__, "../../data/special_recipes_save.csv")
  hats_save = File.join(__dir__, "../../data/hats_save.csv")
  robes_save = File.join(__dir__, "../../data/robes_save.csv")
  advice_save = File.join(__dir__, "../../data/advice_save.csv")

  CSV.open(main_save, "wb") do |csv|
    csv << ["  Name  ", "  Gold  ", "  Hat  ", "  Robe  ", "  Ladle  ", "  Cauldron  "]
    csv << [@name, @gold, @hat, @robe, @ladle, @cauldron]
  end

  counter = 1
  CSV.open(ingredients_save, "wb") do |csv|
    csv << ["Ingredients"]
    @ingredients.map do |ingr|
      csv << [counter, ingr]
      counter += 1
    end
  end

  # CSV.open(special_recipes_save, "wb") do |csv|
  #   csv << ["Special Recipes"]
  #   @special_recipes.map do |ingr|
  #     csv << [counter, ingr]
  #     counter += 1
  #   end
  # end

  # CSV.open(recipes_save, "wb") do |csv|
  #   csv << ["Recipes"]
  #   @recipes.map do |ingr|
  #     csv << [counter, ingr]
  #     counter += 1
  #   end
  # end

  counter = 1
  CSV.open(hats_save, "wb") do |csv|
    csv << ["Hats"]
    @hats.map do |hat|
      csv << [counter, hat]
      counter += 1
    end
  end

  counter = 1
  CSV.open(robes_save, "wb") do |csv|
    csv << ["Robes"]
    @robes.map do |robe|
      csv << [counter, robe]
      counter += 1
    end
  end

  counter = 1
  CSV.open(advice_save, "wb") do |csv|
    csv << ["  Shopkeeper Advice"]
    @advice.map do |advice|
      csv << [counter, advice]
      counter += 1
    end
  end
end

# Loads save files
def load_save_files
  system("touch ../test123.csv")
  CSV.foreach("../test123.csv", headers: :first_row) do |row|
    puts "#{row['Witch name']} #{row['Gold amount']}}"
  end
end

  # Custom method to capitalize a word
  def capitalize(word)
    length = word.length
    beginning = word[0].upcase
    ending = word[1..length].downcase
    return beginning + ending
  end

  # Custom method to capitalize multiple words
  def capitalize_sentence(string)
    string_as_array = string.split(" ")
    string_as_array.map! { |word| capitalize(word) }
    return string_as_array.join(" ")
  end

   # Simple loading screen, finishes with 100% in green.
   def loading
    print "Loading"
    100.times do
      print "."
      sleep(0.03)
    end
    print "100%!".green
    sleep(1.5)
    clear
  end

  #Longer loading screen with optional delay
  def long_loading(delay = 4)
    print "Loading"
    40.times do
      print "."
      sleep(0.05)
    end
    sleep(delay.to_f)
    60.times do
      print "."
      sleep(0.02)
    end
    print "100%!".green
    sleep(1.5)
    clear
  end

  def fast_loading
    print "Loading"
    100.times do
      print "."
      sleep(0.01)
    end
    print "100%!".green
    sleep(1)
    clear
  end

  # Line with 2 parameters. Amount of lines and delay
  def line(time = 0, lines = 1)
    lines.times { puts "" }
    sleep(time.to_f)
  end

  # Clear screen regardless of OS
  def clear
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
  end

  # Simple blinking prompt, continues when user enters anything
  def continue_prompt
    puts "𝖯𝗋𝖾𝗌𝗌 𝖾𝗇𝗍𝖾𝗋 𝗍𝗈 𝖼𝗈𝗇𝗍𝗂𝗇𝗎𝖾".light_black.blink
      gets.chomp
  end

  def slow_dialogue(text, delay = 0.030, continue = true)
    slow_text = text.chars

    slow_text.each do |char|
      if char == "," || char == "." || char == "!"
        print char
        sleep(0.45)
      else
        print char
        sleep(delay)
      end
    end

    2.times {line(0.5)}
    if continue == true
      continue_prompt
    end
  end

  def gruntilda_says(text)
    print "Gruntilda> ".yellow
    slow_dialogue(text, 0.015, false)
  end

  def return_key_for_index(index, hash)
    value = hash.values[index]
    hash.key(value)
  end

  # GAME ENDING BELOW #
  def ending_slow_dialogue(text, delay = 0.040, continue = false)
    slow_text = text.chars

    slow_text.each do |char|
      if char == "," || char == "." || char == "!"
        print char
        sleep(0.25)
      else
        print char
        sleep(delay)
      end
    end
    continue_prompt if continue
  end

  def fill_screen(message, interval = 0.1)
    35.times do
      print message
    end
    sleep(interval)
    system('clear')
  end

  def game_ending
    ending_slow_dialogue("The fumes consume you as you lose sight of who you are, the scent wraps around your body and seeps deep within.".magenta)

    7.times do
      fill_screen("                                                                                                                                                                                                                          ".on_magenta)
      fill_screen("                                                                                                                                                                                                                          ".on_black)
      fill_screen("                                                                                                                                                                                                                          ".on_light_magenta)
    end

    # Move this to dedicated view
    sleep(2)
    25.times { print "reek foul disgusting malodorousness Vile                                                                                                                                                                                                                                       ".light_black.on_white }
    sleep(2.5)
    system('clear')
    25.times { print "VILE FORBIDDEN AMORTENTIA CURSED TABOO                                                                                                                                                                                                                    ".black.on_red }
    ending_slow_dialogue("(: You've suffered a terrible fate haven't you :)".red, 0.1)
    sleep(2)
    10.times { ending_slow_dialogue("(: You've suffered a terrible fate haven't you :)".red, 0.005) }
    30.times { ending_slow_dialogue("(: You've suffered a terrible fate haven't you :)".red, 0.001) }
    250.times { ending_slow_dialogue("):< YOU'VE SUFFERED A TERRIBLE FATE HAVEN'T YOU >:(".red, 0.0001) }
    450.times { ending_slow_dialogue("):< YOU'VE SUFFERED A TERRIBLE FATE HAVEN'T YOU >:(".red, 0.00000001) }
    sleep(4)
    system('clear')
    sleep(1)
    ending_slow_dialogue("\n#{"Glinda> ".cyan}My dear witch, my poor pathetic foolish witch. Your arrogance and greed have been judged by Satan himself.", 0.04)
    ending_slow_dialogue("\n For lack of obedience and submission, despite my countless warnings, you still ventured down the path of temptation, the path of darkness...", 0.04)
    ending_slow_dialogue("\n The path of no return. Since it's come to this, I will share with you the tale of Kazpian, the first to discover the curse of Amortentia.", 0.04)
    sleep(4)

    ending_slow_dialogue("\n\n#{"Glinda> ".cyan}Kazpian was sold into slavery as a child. He was raised in the royal harem and spent his days weaving and blindly obeying his master.", 0.045)
    ending_slow_dialogue("\n He was given a glimpse of a future he would never have as he watched kids of his age study to become witches and warlocks.", 0.045)
    ending_slow_dialogue("\n After his master and highness lord Jania was assassinated during a coup, Radea; my sister, discovered the young boy.", 0.045)
    ending_slow_dialogue("\n He was a feeble, sorry sight for the eyes. No will of his own yet he gleamed with an air of potential. She offered the boy a choice: freedom or power.", 0.045)
    ending_slow_dialogue("\n More than anything he wanted to be free of his shackles that have long since been embedded in his heart and soul; but more than that, he wanted revenge.", 0.045)
    ending_slow_dialogue("\n Kazpian took Radea's hand as she lifted him off his knees for the last time. 'Never again will you bow down to another.", 0.045)
    ending_slow_dialogue("\n We are descendants from the great Esther herself, and we will be the past, the present and the future of this world' she said.", 0.045)
    sleep(4)

    ending_slow_dialogue("\n\n#{"Glinda> ".cyan}Over the many moons, Kazpian learnt and adapted quickly to his newfound knowledge and surroundings.", 0.045)
    ending_slow_dialogue("\n One day he was out searching for ingredients to make potions and noticed a peculiar aroma he'd never smelt before.", 0.045)
    ending_slow_dialogue("\n It was sweet but bitter; subtle yet powerful, it was enticing.", 0.045)
    ending_slow_dialogue("\n Although he never was able to find the source of such a captivating scent, he began to obsess over it and attempted to recreate it day in and day out.", 0.045)
    ending_slow_dialogue("\n Radea couldn't bear to see her precious student lose himself in his research; before long, she reached out to me and begged for my assistance.", 0.045)
    ending_slow_dialogue("\n I had always been the more powerful, beautiful, intelligent, accomplished, beloved and renown witch between the two of us, still I reluctantly accepted.", 0.045)
    ending_slow_dialogue("\n I could see only one thing in his eyes, hunger. An insatiable thirst for something...", 0.045)
    sleep(4)

    ending_slow_dialogue("\n\n#{"Glinda> ".cyan}Every day he created potions and documented the results in his journal. As time went on, I could tell he was nearing completion of his goal.", 0.035)
    ending_slow_dialogue("\n One day he returned home in a frenzy! He claimed that he had finally figured it out, but before taking action he wrote everything down in his journal.", 0.035)
    ending_slow_dialogue("\n When he was finished, he immediately began mixing potions together and brewing a potion of the likes I had never seen nor smelt before.", 0.035)
    ending_slow_dialogue("\n Something felt wrong, so I peeked in his journal and saw this page open, glaring back at me. It read:", 0.035)
    sleep(3)

    ending_slow_dialogue("\n\n#{"Kaz's journal:".black.on_light_red}\n #{"Moon cycle: 1743".black.on_light_red}\n #{"Moon: ".black.on_light_red}#{"Garnet".red.on_light_red}\n\n #{"Kazpian> ".light_red}I've almost figured it out... the vial of Amortentia. I've tried and failed so many times, but this moon will be different.", 0.05)
    ending_slow_dialogue("\n I've discovered that the key ingredient isn't an ingredient at all, it's a potion!! In fact, all the ingredients are potions.", 0.05)
    ending_slow_dialogue("\n This is my hypothesis, if you combine the time potion with a bowl of smoke and embers and a dash of mobile madness, you create the curse of Amortentia!", 0.05)
    ending_slow_dialogue("\n During my scouting expeditions in the forest, I found remnants of a cult long since passed. They worshipped the Goddess of love and pain, Amortentia.", 0.05)
    ending_slow_dialogue("\n It's unclear what happened to this cult, but signs point to a battle that resulted in them abandoning this land.", 0.05)
    ending_slow_dialogue("\n what they left behind however, was the means to control another living being through the power of aromas alone.", 0.05)
    ending_slow_dialogue("\n The only problem is, they never specified the final ingredient. Without it, who knows what effect the potion could have.", 0.05)
    ending_slow_dialogue("\n\n #{"Moon cycle: 1743".black.on_light_red}\n #{"Moon: ".black.on_light_red}#{"Scarlet".red.on_light_red}\n\n #{"Kazpian> ".light_red}I've almost figured it out... the vial of Amortentia. I've tried and failed so many times, but this moon will be different.", 0.05)
    ending_slow_dialogue("\n Today I discovered what my potions have been lacking... It's the #{"blood".red} of a witch.", 0.05)
    ending_slow_dialogue("\n Most likely this is what caused their disappearance, as these grounds are known to be witching territory. I must discover for myself if this witchcraf#{"-".light_red}", 0.05)
    sleep(4)

    ending_slow_dialogue("\n\n#{"Glinda> ".light_red} I averted my gaze. I couldn't believe the horrors I had read; this boy was willing to sacrifice us for the possibility of creating a potion...", 0.04)
    ending_slow_dialogue("\n I grabbed his journal and shattered a vial of Netherite in my OWN home! It exploded and caught everything on fire.", 0.04)
    ending_slow_dialogue("\n I didn't look back I just kept running into the forest, destroying the book as I ran deeper and deeper...", 0.04)
    ending_slow_dialogue("\n Until I reached a dead end, when I turned back, there was nobody there. No trace I had ever been followed.", 0.04)
    ending_slow_dialogue("\n By the time I returned home, the boy was gone, the fires extinguished. I never saw him again after that, he'd stolen all my potions and ingredients.", 0.04)
    sleep(4)

    ending_slow_dialogue("\n\n#{"Glinda> ".light_red} Shortly afterwards, the council came for me... Accusing me of reproducing and teaching forbidden witchcraft.", 0.045)
    ending_slow_dialogue("\n They sanctioned my studies and demanded I be burnt at the stake if I were to ever practice potion making again.", 0.05)
    ending_slow_dialogue("\n\n NYAAAAAAAAAAAAAAAAAKAAAAKAAAKAAKAAAAAaaaaa....".red, 0.015)
    ending_slow_dialogue("\n\n #{"Glinda> ".light_red}As if those lowly witches and warlocks could ever separate me from witchcraft, they'd sooner have better luck removing the trees from a forest.", 0.035)
    ending_slow_dialogue("\n I had no choice but to drink the philter of desires and transform my body into this disgusting witch you see before you.", 0.035)
    ending_slow_dialogue("\n I changed my name to Gruntilda and severed all ties with Radea. But still I wonder... what became of Kazpian?", 0.05)
    ending_slow_dialogue("\n Did he ever get what he wanted in the end? I wonder if he'd ever come back, to finish what he started #{". . .".red}\n", 0.06, true)
    system('clear')
    sleep(1)
    ending_slow_dialogue("\n You are now tinky for life#{". . .".red}\n", 0.05)
    sleep(1.5)
    ending_slow_dialogue("\n Even after completing this 1 full moon cycle later at 27, your tinkiness is just as potent #{"!".red}\n", 0.05)
    sleep(1)
    ending_slow_dialogue("\n Credits: me, I did everything. :D ! Also thanks to all my testers <3 and thanks to Elisa for finally beating the game #{"!".light_cyan}\n", 0.05)
    sleep(3)
  end
end


  # Future save method

  # Will need to play with this, goal to make one save method for all (maybe hash save will be diff method)
  # def save(save_path, to_be_saved)
  #   CSV.open(save_path, "wb") do |csv|
  #     to_be_saved.each do |thing|
  #       csv << thing
  #     end
  #   end
  # end

  # # Will need to play with this, goal to make one load method for all (maybe hash load will be diff method)
  # def load(load_path, to_be_loaded)
  #   CSV.foreach(load_path) do |row|
  #     to_be_loaded << row
  #   end
  # end
