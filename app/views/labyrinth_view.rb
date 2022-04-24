require 'colorize'

class LabyrinthView < MainView
  attr_reader :area_descriptions, :area_transition_descriptions, :tutorial

  def initialize
      @title_art = "
      ░██╗░░░░░░░██╗██╗░█████╗░░█████╗░░█████╗░███╗░░██╗
      ░██║░░██╗░░██║██║██╔══██╗██╔══██╗██╔══██╗████╗░██║
      ░╚██╗████╗██╔╝██║██║░░╚═╝██║░░╚═╝███████║██╔██╗██║
      ░░████╔═████║░██║██║░░██╗██║░░██╗██╔══██║██║╚████║
      ░░╚██╔╝░╚██╔╝░██║╚█████╔╝╚█████╔╝██║░░██║██║░╚███║
      ░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝

      ██╗░░░░░░█████╗░██████╗░██╗░░░██╗██████╗░██╗███╗░░██╗████████╗██╗░░██╗
      ██║░░░░░██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗██║████╗░██║╚══██╔══╝██║░░██║
      ██║░░░░░███████║██████╦╝░╚████╔╝░██████╔╝██║██╔██╗██║░░░██║░░░███████║
      ██║░░░░░██╔══██║██╔══██╗░░╚██╔╝░░██╔══██╗██║██║╚████║░░░██║░░░██╔══██║
      ███████╗██║░░██║██████╦╝░░░██║░░░██║░░██║██║██║░╚███║░░░██║░░░██║░░██║
      ╚══════╝╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝"
      @tips = [
        "Keep pressing #{"'".yellow}enter#{"'".yellow} in a menu to cycle through the tips #{'/'.yellow} hints#{'.'.yellow}",
        "There are 8 regions in the labyrinth#{','.yellow} 2 of which are dangerous#{'.'.yellow}",
        "If you die#{','.yellow} you don#{"'".yellow}t lose anything but you respawn in a different #{'('.yellow}safer#{')'.yellow} room#{'.'.yellow}",
        "Technically#{','.yellow} the labyrinth is a maze#{'...'.yellow} But labyrinth sounds much cooler#{'.'.yellow}",
        'Try to find the center of the labyrinth.',
        'The center of labyrinth is the only room in which you can freely move in any direction.',
        'There are a total of 400 rooms in the labyrinth, nobody has ever seen them all, nobody.',
        "You'll be alone in the labyrinth, I'm pretty sure at least. Yeah, or maybe ... no yeah you're most likely alone, probably.",
        "Not all tips are useful, most of them are, but this one isn't."
      ]
      @tutorial = "Welcome... to the Wiccan Labyrinth#{'!!'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} This will test the will and endurance of even the most wicked of witches#{'.'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} Caution to the brave and foolish enough to enter these grounds#{','.yellow} Nyaaakakaa#{'.'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} You'll need to navigate the labyrinth blindly by following random paths#{'.'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} There are many regions#{','.yellow} some big and some small#{'.'.yellow} Some safe and some... not so safe#{'.'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} As you progress through the trial#{','.yellow} you'll find robes and hats of previous fools#{'.'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} They've got no use for it now NYAAK#{','.yellow} so if you see something#{','.yellow} grab it#{'!'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} If an area is dangerous#{','.yellow} you'll receive a warning#{','.yellow} don't ignore it#{'!'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} If you do#{','.yellow} you'll find yourself waking up outside the labyrinth#{','.yellow} courtesy of yours truly#{'!'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} When you enter the labyrinth again#{','.yellow} you'll be somwhere completely different#{','.yellow} be warned#{'!'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} Last but not least#{','.yellow} there are a total of #{'21'.yellow} items to find in the labyrinth#{'!'.yellow}\n
                  #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_yellow} They're evenly scattered so good luck#{','.yellow} and try not to die.. NYAAAKAKAAAAA#{'!'.yellow}\n"
      @area_descriptions = {
        center_area: [
          'Standing in the center of the labyrinth, you feel a calming sensation envelop you.',
          "You're at the center of the labyrinth, you look northwest and see a desert.",
          "You're at the center of the labyrinth, you look northeast and see a mountain.",
          "You're at the center of the labyrinth, you look southwest and see a marsh.",
          "You're at the center of the labyrinth, you look southeast and see a jungle.",
          "The center of the labyrinth, it's quiet, you stop to rest your weary bones for a moment.",
          'You are at the center of the labyrinth, everything connects here.',
          'Everything connects here, this must be the center of the labyrinth.',
          "It's quiet, the climate is balanced, it's safe here. You're at the center of the labyrinth.",
          "You're at the center of the labyrinth, stay for as long as you'd like.",
          'No danger in site, a path in all directions, you take some time to plan your next move.'
        ],
        dark_area: [
          "It's too dark to see here",
          "Eyes open or closed, you can't see a thing",
          'The darkness makes it impossible to navigate here',
          'The cave is unsettling, you struggle to make sense of your surroundings.',
          "you are in the dark, you hope you're here alone.",
          "you are in the dark, you're blinded.",
          'You tread lightly, there might be death pits or crazy people here.',
          "you are in the dark, you can't see anything around you.",
          "Your heart's racing, you can't make out anything in the dark.",
          "It's too dark for comfort, best to not dwell in here.",
          "It's impossible to navigate in this cave, you can't see anything.",
          "You're in a cave.",
          "The cave would be a nice resting spot if it weren't so creepy."
        ],
        volcano_area: [
          "Scolding molten laval surrounds you, you're burning up",
          "Your robe is smoking, it wasn't designed for this amount of heat",
          'The heat from the volcano is unbearable, your lungs fill with ash',
          "It's too hot even for a witch, you shouldn't stay long",
          "It's too hot even for a witch, you need to leave soon",
          "It's way too hot to stay, even for a witch. Don't doddle.",
          "you're at the volcano's peak, it's HOT HOT HOT!!!",
          "you're at the volcano's peak, it's too hot even for a witch",
          'This volcano is treacherous, you watch your step as you traverse.',
          "you're at the volcano's peak, no time for dwelling in a place like this",
          "You cough as you gasp for air, you can't stay here for much longer",
          'A desert sounds cool and refreshing faced with the heat of the volcano.'
        ],
        swamp_area: [
          'You spot a minx, they make good pets. They also make for a tasty snack.',
          'Your robe is soaked with swamp water, the temperature is nice and warm.',
          'All around you is water that varies from yellow to a deep brown, yuck, swamps.',
          'The swamp water is at your waist, you feel something brush up against your legs as you walk.',
          'The swamp water is at your waist, something tickles your legs as you walk.',
          "you're in a swamp, lurking eyes glare at you from beneath the water",
          "you're in a swamp, home to frogs, turtles, snakes, alligators, minxes and woodpeckers.",
          "you're in a swamp, lurking eyes glare at you from beneath the water",
          'It smells horrible here but the weather is nice, for a swamp.',
          'You try to picture yourself on a beach, and not in a swamp.',
          "The smell of the swamp wafts through the air, it's not a pleasant scent."
        ],
        tundra_area: [
          "You slip, there's ice beneath your feet. It's cold, VERY cold.",
          "It's too cold here, your joints are stiffening up with every passing second.",
          'The frozen tundra, this is not a place a witch would visit often.',
          "It's freezing here, you have a hard time breathing.",
          "It's freezing, everything around you is caked in snow, you better not stay too long.",
          "It's freezing, everything around you is frozen, you should leave soon.",
          'Everything around you is covered in a layer of thick ice.',
          "You can see your breath, but you can't feel your toes.",
          'You quickly discover what frostbite is in this harsh tundra.',
          "You can see your breath, you wish you couldn't.",
          'I wish there was a potion to rid the world of tundras like these.',
          'You forget what it was like to feel your limbs as your body slowly freezes.'
        ],
        desert_area: [
          "The sun is beating down on you, you're parched. You're in a barren desert.",
          'Nothing but sand stretches in every direction.',
          'You see Gruntilda making a potion, must be a mirrage from the heat',
          'Deserts, boiling in the day and freezing at night, a sandy wasteland surrounds you.',
          "You're standing in a desert, the extreme temperature and sparse vegetation is uninviting.",
          "There's a large body of water right bef- oh nevermind, another mirrage.",
          'Your feet are sweating, the sand is hot and the sun is relentless.',
          "You're in a desert, cacti and tumbleweeds surround you.",
          "You're in a desert, sand and more sand surround you.",
          'A long stretch of desert lies ahead of you.',
          "You're standing in a desert, other than the occasional bones, there's not much to see here.",
          'You begin to talk to yourself as the heat slowly fries your brain.',
          "Faintly, you hear the melodic sound of a guitar, it reminds you of gerudo valley.",
          "The sun is beating down on you, you're parched. You're in a barren desert.",
          'Nothing but sand stretches in every direction.',
          'You see Gruntilda making a potion, must be a mirrage from the heat',
          'Deserts, boiling in the day and freezing at night, a sandy wasteland surrounds you.',
          "You're standing in a desert, the extreme temperature and sparse vegetation is uninviting.",
          "There's a large body of water right bef- oh nevermind, another mirrage.",
          'Your feet are sweating, the sand is hot and the sun is relentless.',
          "You're in a desert, cacti and tumbleweeds surround you.",
          "You're in a desert, sand and more sand surround you.",
          'A long stretch of desert lies ahead of you.',
          "You're standing in a desert, other than the occasional bones, there's not much to see here.",
          'You begin to talk to yourself as the heat slowly fries your brain.',
          "Faintly, you hear the melodic sound of a guitar, it reminds you of gerudo valley.",
          "The sun is beating down on you, you're parched. You're in a barren desert.",
          'Nothing but sand stretches in every direction.',
          'You see Gruntilda making a potion, must be a mirrage from the heat',
          'Deserts, boiling in the day and freezing at night, a sandy wasteland surrounds you.',
          "You're standing in a desert, the extreme temperature and sparse vegetation is uninviting.",
          "There's a large body of water right bef- oh nevermind, another mirrage.",
          'Your feet are sweating, the sand is hot and the sun is relentless.',
          "You're in a desert, cacti and tumbleweeds surround you.",
          "You're in a desert, sand and more sand surround you.",
          'A long stretch of desert lies ahead of you.',
          "You're standing in a desert, other than the occasional bones, there's not much to see here.",
          'You begin to talk to yourself as the heat slowly fries your brain.',
          "Faintly, you hear the melodic sound of a guitar, it reminds you of gerudo valley.",
          "The sun is beating down on you, you're parched. You're in a barren desert.",
          'Nothing but sand stretches in every direction.',
          'You see Gruntilda making a potion, must be a mirrage from the heat',
          'Deserts, boiling in the day and freezing at night, a sandy wasteland surrounds you.',
          "You're standing in a desert, the extreme temperature and sparse vegetation is uninviting.",
          "There's a large body of water right bef- oh nevermind, another mirrage.",
          'Your feet are sweating, the sand is hot and the sun is relentless.',
          "You're in a desert, cacti and tumbleweeds surround you.",
          "You're in a desert, sand and more sand surround you.",
          'A long stretch of desert lies ahead of you.',
          "You're standing in a desert, other than the occasional bones, there's not much to see here.",
          'You begin to talk to yourself as the heat slowly fries your brain.',
          "Faintly, you hear the melodic sound of a guitar, it reminds you of gerudo valley.",
          "#{'Easter'.light_magenta} #{'egg'.light_cyan} #{':)'.light_green}".blink
        ],
        mountain_area: [
          "The weather isn't bad but at the summit of the mountain lies an active volcano",
          "Your feet hurt, you're on a mountain with lots of hills and cliffs.",
          'You travel the mountains, as you look back you can see the entire region.',
          'As you look down from the mountains, you spot a jungle and a desert nearby.',
          'You spot goats and vultures as you traverse the mountains.',
          'Your legs are tired, the mountains are the last place you feel like being.',
          'You spot eagles and foxes as you traverse the treacherous mountains.',
          'From up this high, you imagine yourself flying over the labyrinth.',
          'The air is thin in the mountains, the terrain is rocky and rough.',
          'Your legs grow weary from this trying clamber, the mountains are for the fit.',
          'The air is thin in the mountains, you try to avoid the volcano at the top.',
          "Rocks, rocks and more rocks. There's not much going on in the mountains.",
          'Lovely day to get lost in the mountains.'
        ],
        jungle_area: [
          'The sound of mighty roars and desperate yelps fill your ears, this jungle is huge.',
          'Tall trees, thick vines and humid temperatures make for a perfect jungle.',
          'The Jungles, home to monkeys and tigers, not witches... Be careful.',
          "You're in a jungle, although the weather is nice, it's not the safest place to be",
          'The jungle, a dangerous yet lively habitat. The weather is nice and warm.',
          'Long thick and lush greenery greet you at every glance, jungles are truly beautiful.',
          'Jungles, are as captivating as they are dangerous. Best not to get caught off guard.',
          'The air is humid, you gulp audibly as you scan your surroundings.',
          'The air is humid, you feel danger lurking all around you.',
          "Walking in the jungle, you wonder if you'll run into a tiger or something.",
          'Aware of your position in the food chain, you hurry to traverse the jungle in one piece.',
          "OOOOOOOOOO AaOooAaooOoooooooo! You imagine yourself swinging through the jungle",
          "A snake crosses your path, stares at you for a brief moment as you tense up, then continues on its way.",
          "The bushes around you ruffle, you scurry along to hurry out of the jungle."
        ],
        marsh_area: [
          'Your feet are soaked. At least the water is only at your ankles.',
          'The flooded wetlands, small patches of dry land are scace.',
          "With every step splashing, it's impossible for anything to sneak around here.",
          "The air is humid, the land is flooded. You're in a marsh.",
          "You're in a marsh, the land is oversaturated with water.",
          "You're in a marsh, papyrus trees twist and twine around you.",
          "You're in the middle of a marsh, around you are streams and lakes.",
          "You're in a marsh, and you really wish you weren't.",
          'Wetlands, exactly as the name suggests, everything is soaked.',
          'Although the marsh water is low, anything can be lurking under the water.',
          "The fields are flooded and your feet are soaked, there's nothing worse than wet socks.",
          "You notice a clew of leaches tethered to your calves, disgusting!",
          "Something brushes up against your foot, nope nope nope nope nope!"
        ]
      }
      @area_transition_descriptions = {
        # Region transitions
        desert_mountain_transition: [
          'The air is hot and dry, west leads to a desert, east leads to a mountain',
          'You find a sign that reads: ←Desert  --  Mountain→'
        ],
        desert_marsh_transition: [
          'You feel warm, you scan your surroundings and find a desert north and a marsh south',
          'You find a sign that reads: ↑Desert  --  Marsh↓'
        ],
        jungle_mountain_transition: [
          "It's warm, you see a jungle to the south and a mountain to the north",
          'You find a sign that reads: ↓Jungle --  Mountain↑'
        ],
        jungle_marsh_transition: [
          "It's very humid, you must be between a jungle and a marsh",
          'You find a sign that reads: ←Marsh  --  Jungle→'
        ],
        # Inner-region transitions
        desert_dark_transition: [
          "You're near a cave, it's #{'dark'.light_black} but cool in there. Outside is hot and dry",
          "You find a sign that reads: Super safe inconspicuous #{'cave'.light_black} ahead #{'↑'.light_black}"
        ],
        mountain_volcano_transition: [
          "The center of the #{'volcano'.red} is nearby, it's unbearably #{'hot'.red}",
          "You find a sign that reads: #{'Warning!'.red} Active volcano ahead #{'↑'.red}"
        ],
        jungle_swamp_transition: [
          "You're deep in the jungle, you notice a #{'swamp'.green} nearby",
          "You find a sign that reads: #{'Swamp'.green} ahead #{'↑'.green}"
        ],
        marsh_tundra_transition: [
          "The soaked fields are freezing, you're near a #{'freezing tundra'.cyan}",
          "You find a sign that reads: #{'Warning!'.cyan} Frozen tundra ahead #{'↑'.cyan}"
        ]
      }
  end

  def labyrinth_main_menu
    print 'Tip: '.yellow
    puts @tips.sample
    puts ""
    puts @title_art.yellow.blink
    puts ''
    puts " Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ #{'?'.yellow}"
    puts ''
    sleep(0.05)
    puts " 𝟙 #{'-'.yellow} ℙ𝕝𝕒𝕪"
    puts ''
    sleep(0.05)
    puts " 𝟚 #{'-'.yellow} 𝕋𝕦𝕥𝕠𝕣𝕚𝕒𝕝"
    puts ''
    sleep(0.05)
    puts " 𝟡 #{'-'.yellow} #{'𝔹𝕒𝕔𝕜'.light_red}"
    puts ''
    sleep(0.05)
    puts ''
  end

  def labyrinth_menu_options(role, last_move)
    puts @title_art.yellow
    puts ''
    available_direction_arrows(role)
    puts ''
    puts ''
    puts "Pick a #{'direction'.yellow}"
    puts "#{'('.yellow}#{'Last move'.light_black}#{', '.yellow}#{last_move.light_black}#{')'.yellow}"
    puts ''
    sleep(0.02)
    puts "#{' - '.yellow}Up"
    puts ''
    sleep(0.02)
    puts "#{' - '.yellow}Down"
    puts ''
    sleep(0.02)
    puts "#{' - '.yellow}Left"
    puts ''
    sleep(0.02)
    puts "#{' - '.yellow}Right"
    puts ''
    sleep(0.02)
  end

  def room_visited?(room)
    if room.visited
      "#{'('.yellow}#{"You've been here before...".light_black}#{')'.yellow}"
    else
      "#{'('.yellow}#{'New room'.light_black}#{')'.yellow}"
    end
  end

    def display_no_room
      puts "Yᴏᴜ ᴄᴀɴ'ᴛ ɢᴏ ᴛʜᴀᴛ ᴡᴀʏ".light_red
    end

    def move_to_next_room
      'Yᴏᴜ ᴍᴏᴠᴇ ɪɴᴛᴏ ᴛʜᴇ ɴᴇxᴛ ʀᴏᴏᴍ...'.light_black.blink
    end

    def press_9_to_quit
      nine = " 9 ".light_red
      print "Tɪᴘ: ".yellow
      print "Pʀᴇss".light_black
      print nine
      puts "ᴀᴛ ᴀɴʏ ᴛɪᴍᴇ ᴛᴏ ʀᴇᴛᴜʀɴ ᴛᴏ ᴛʜᴇ ᴍᴀɪɴ ᴍᴇɴᴜ. Wʜᴇɴ ʏᴏᴜ ᴘʟᴀʏ ᴀɢᴀɪɴ ʏᴏᴜ'ʟʟ sᴛᴀʀᴛ ғʀᴏᴍ ᴛʜᴇ sᴀᴍᴇ ʀᴏᴏᴍ.".light_black
    end

  # Displays arrows depending on which direction is available
  def available_direction_arrows(role)
    case role
    when :top_left_corner
      print "         #{'Left'.light_black}#{' ← '.light_black}"
      print "         #{'Up'.light_black}#{' ↑ '.light_black}"
      print "         #{'Down'.green}#{' ↓ '.green.blink}"
      print "         #{'Right'.green}#{' → '.green.blink}"
    when :top_right_corner
      print "         #{'Left'.green}#{' ← '.green.blink}"
      print "         #{'Up'.light_black}#{' ↑ '.light_black}"
      print "         #{'Down'.green}#{' ↓ '.green.blink}"
      print "         #{'Right'.light_black}#{' → '.light_black}"
    when :bottom_left_corner
      print "         #{'Left'.light_black}#{' ← '.light_black}"
      print "         #{'Up'.green}#{' ↑ '.green.blink}"
      print "         #{'Down'.light_black}#{' ↓ '.light_black}"
      print "         #{'Right'.green}#{' → '.green.blink}"
    when :bottom_right_corner
      print "         #{'Left'.green}#{' ← '.green.blink}"
      print "         #{'Up'.green}#{' ↑ '.green.blink}"
      print "         #{'Down'.light_black}#{' ↓ '.light_black}"
      print "         #{'Right'.light_black}#{' → '.light_black}"
    when :only_up
      print "         #{'Left'.light_black}#{' ← '.light_black}"
      print "         #{'Up'.green}#{' ↑ '.green.blink}"
      print "         #{'Down'.light_black}#{' ↓ '.light_black}"
      print "         #{'Right'.light_black}#{' → '.light_black}"
    when :only_down
      print "         #{'Left'.light_black}#{' ← '.light_black}"
      print "         #{'Up'.light_black}#{' ↑ '.light_black}"
      print "         #{'Down'.green}#{' ↓ '.green.blink}"
      print "         #{'Right'.light_black}#{' → '.light_black}"
    when :only_left
      print "         #{'Left'.green}#{' ← '.green.blink}"
      print "         #{'Up'.light_black}#{' ↑ '.light_black}"
      print "         #{'Down'.light_black}#{' ↓ '.light_black}"
      print "         #{'Right'.light_black}#{' → '.light_black}"
    when :only_right
      print "         #{'Left'.light_black}#{' ← '.light_black}"
      print "         #{'Up'.light_black}#{' ↑ '.light_black}"
      print "         #{'Down'.light_black}#{' ↓ '.light_black}"
      print "         #{'Right'.green}#{' → '.green.blink}"
    when :no_up
      print "         #{'Left'.green}#{' ← '.green.blink}"
      print "         #{'Up'.light_black}#{' ↑ '.light_black}"
      print "         #{'Down'.green}#{' ↓ '.green.blink}"
      print "         #{'Right'.green}#{' → '.green.blink}"
    when :no_down
      print "         #{'Left'.green}#{' ← '.green.blink}"
      print "         #{'Up'.green}#{' ↑ '.green.blink}"
      print "         #{'Down'.light_black}#{' ↓ '.light_black}"
      print "         #{'Right'.green}#{' → '.green.blink}"
    when :no_left
      print "         #{'Left'.light_black}#{' ← '.light_black}"
      print "         #{'Up'.green}#{' ↑ '.green.blink}"
      print "         #{'Down'.green}#{' ↓ '.green.blink}"
      print "         #{'Right'.green}#{' → '.green.blink}"
    when :no_right
      print "         #{'Left'.green}#{' ← '.green.blink}"
      print "         #{'Up'.green}#{' ↑ '.green.blink}"
      print "         #{'Down'.green}#{' ↓ '.green.blink}"
      print "         #{'Right'.light_black}#{' → '.light_black}"
    when :only_vertical
      print "         #{'Left'.light_black}#{' ← '.light_black}"
      print "         #{'Up'.green}#{' ↑ '.green.blink}"
      print "         #{'Down'.green}#{' ↓ '.green.blink}"
      print "         #{'Right'.light_black}#{' → '.light_black}"
    when :only_horizontal
      print "         #{'Left'.green}#{' ← '.green.blink}"
      print "         #{'Up'.light_black}#{' ↑ '.light_black}"
      print "         #{'Down'.light_black}#{' ↓ '.light_black}"
      print "         #{'Right'.green}#{' → '.green.blink}"
    when :any_direction
      print "         #{'Left'.green}#{' ← '.green.blink}"
      print "         #{'Up'.green}#{' ↑ '.green.blink}"
      print "         #{'Down'.green}#{' ↓ '.green.blink}"
      print "         #{'Right'.green}#{' → '.green.blink}"
    end
  end
end
