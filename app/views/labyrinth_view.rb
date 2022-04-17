require 'colorize'

class LabyrinthView < MainView
  attr_reader :area_descriptions, :area_transition_descriptions

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
        @area_descriptions = {
          center_area: [
            'Standing in the center of the maze, you feel a calming sensation envelop you.',
            "You're at the center of the maze, you look northwest and see a desert.",
            "You're at the center of the maze, you look northeast and see a mountain.",
            "You're at the center of the maze, you look southwest and see a marsh.",
            "You're at the center of the maze, you look southeast and see a jungle.",
            'You are at the center of the labyrinth, everything connects here.',
            'You are at the center of the labyrinth, everything connects here.',
            'You are at the center of the labyrinth, everything connects here.',
            "It's quiet, the climate is balanced, it's safe here. You're at the center of the maze.",
            "It's quiet, the climate is balanced, it's safe here. You're at the center of the maze.",
            "It's quiet, the climate is balanced, it's safe here. You're at the center of the maze.",
          ],
          dark_area: [
            "It's too dark to see here",
            "Eyes open or closed, you can't see a thing",
            'The darkness makes it impossible to navigate here',
            'The cave is unsettling, you struggle to make sense of your surroundings.',
            "you are in the dark, you hope you're here alone.",
            "you are in the dark, you're blinded.",
            "you are in the dark, you can't see anything around you.",
            "you are in the dark, you can't see anything around you.",
            "you are in the dark, you can't see anything around you.",
            "you are in the dark, you can't see anything around you."
          ],
          volcano_area: [
            "Scolding molten laval surrounds you, you're burning up",
            "Your robe is smoking, it wasn't designed for this amount of heat",
            'The heat from the volcano is unbearable, your lungs fill with ash',
            "It's too hot even for a , you shouldn't stay long",
            "It's too hot even for a witch, you shouldn't stay long",
            "It's too hot even for a witch, you shouldn't stay long",
            "you're at the volcano's peak, it's HOT HOT HOT!!!",
            "you're at the volcano's peak, it's too hot even for a witch",
            "you're at the volcano's peak, it's so hot you can barely breathe",
            "you're at the volcano's peak, it's so hot you can barely breathe",
            "you're at the volcano's peak, it's so hot you can barely breathe"
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
            "you're in a swamp, it smells horrible here but the weather is nice."
          ],
          tundra_area: [
            "You slip, there's ice beneath your feet. It's cold, VERY cold.",
            "It's too cold here, your joints are stiffening up with every passing second.",
            'The frozen tundra, this is not a place a witch would visit often.',
            "You can see your breath, it's freezing here",
            "You can see your breath, it's freezing here",
            "You can see your breath, it's freezing here",
            "It's freezing here, you have a hard time breathing.",
            "It's freezing, everything around you is caked in snow, you better not stay too long.",
            "It's freezing, everything around you is frozen, you should leave soon.",
            "It's freezing, everything around you is covered in a layer of thick ice.",
          ],
          desert_area: [
            "The sun is beating down on you, you're parched. You're in a barren desert.",
            'Nothing but sand stretches in every direction.',
            'You see Gruntilda making a potion, must be a mirage from the heat',
            'Deserts, boiling in the day and freezing at night, a sandy wasteland surrounds you.',
            "You're standing in a desert, the extreme temperature and sparse vegetation is uninviting.",
            "You're standing in a desert, the extreme temperature and sparse vegetation is uninviting.",
            "You're in a desert, cacti and tumbleweeds surround you.",
            "You're in a desert, cacti and tumbleweeds surround you.",
            'A long stretch of desert lies ahead of you.',
            "You're standing in a desert, other than the occasional bones, there's not much to see here.",
            "You're standing in a desert, other than the occasional bones, there's not much to see here."
          ],
          mountain_area: [
            "The weather isn't bad but at the summit of the mountain lies an active volcano",
            "Your feet hurt, you're on a mountain with lots of hills and cliffs.",
            'You travel the mountains, as you look back you can see the entire region.',
            'As you look down from the mountains, you spot a jungle and a desert nearby.',
            'You spot goats and vultures as you traverse the mountains.',
            'Your legs are tired, the mountains are the last place you feel like being.',
            'You spot eagles and foxes as you traverse the treacherous mountains.',
            'The air is thin in the mountains, the terrain is rocky and rough.',
            'The air is thin in the mountains, the terrain is rocky and rough.',
            'The air is thin in the mountains, the terrain is rocky and rough.',
            'The air is thin in the mountains, the terrain is rocky and rough.'
          ],
          jungle_area: [
            'The sound of mighty roars and desperate yelps fill your ears, this jungle is huge.',
            'Tall trees, thick vines and humid temperatures make for a perfect jungle.',
            'The Jungles, home to monkeys and tigers, not witches... Be careful.',
            "You're in a jungle, although the weather is nice, it's not the safest place to be",
            'The jungle, a dangerous yet lively habitat. The weather is nice and warm.',
            'The jungle, a dangerous yet lively habitat. The weather is nice and warm.',
            'The jungle, a dangerous yet lively habitat. The weather is nice and warm.',
            'The air is humid, you feel danger lurking all around you.',
            'The air is humid, you feel danger lurking all around you.',
            'The air is humid, you feel danger lurking all around you.'
          ],
          marsh_area: [
            'Your feet are soaked. At least the water is only at your ankles.',
            'The flooded wetlands, small patches of dry land are scace.',
            "With every step splashing, it's impossible for anything to sneak around here.",
            "The air is humid, the land is flooded. You're in a marsh.",
            "You're in a marsh, the land is oversaturated with water.",
            "You're in a marsh, papyrus trees twist and twine around you.",
            "You're in the middle of a marsh, around you are streams and lakes.",
            "You're in a marsh, everything around you is flooded.",
            "You're in a marsh, everything around you is flooded.",
            "You're in a marsh, everything around you is flooded.",
            "You're in a marsh, everything around you is flooded."
          ]
        }
        @area_transition_descriptions = {
          # Region transitions
          desert_mountain_transition: 'The air is hot and dry, one way leads to a desert, the other to a mountain.',
          desert_marsh_transition: 'You feel warm, as you scan your surroundings you see a desert in one direction and a marsh in the other.',
          jungle_mountain_transition: "It's warm, you see a jungle in one direction and a mountain in the other.",
          jungle_marsh_transition: "It's very humid, you must be between a jungle and a marsh.",
          # Inner-region transitions
          desert_dark_transition: "You're near a cave, it's dark but cool in there. Outside is hot and dry.",
          mountain_volcano_transition: "The center of the volcano is nearby, it's unbearably hot",
          jungle_swamp_transition: "You're deep in the jungle, you notice a swamp nearby.",
          marsh_tundra_transition: "The soaked fields are freezing, you're near a freezing tundra."
        }
    end

    def display_no_room
        puts "Yᴏᴜ ᴄᴀɴ'ᴛ ɢᴏ ᴛʜᴀᴛ ᴡᴀʏ".light_red
    end

    def move_to_next_room
        "Yᴏᴜ ᴍᴏᴠᴇ ɪɴᴛᴏ ᴛʜᴇ ɴᴇxᴛ ʀᴏᴏᴍ...".light_black.blink
    end

    def last_move(direction)
        "#{'Lᴀsᴛ ᴍᴏᴠᴇ:'.light_black} #{direction.yellow}."
    end

    def press_9_to_quit
        nine = " 9 ".light_red
        print "Tɪᴘ: ".yellow
        print "Pʀᴇss".light_black
        print nine
        puts "ᴀᴛ ᴀɴʏ ᴛɪᴍᴇ ᴛᴏ ʀᴇᴛᴜʀɴ ᴛᴏ ᴛʜᴇ ᴍᴀɪɴ ᴍᴇɴᴜ. Wʜᴇɴ ʏᴏᴜ ᴘʟᴀʏ ᴀɢᴀɪɴ ʏᴏᴜ'ʟʟ sᴛᴀʀᴛ ғʀᴏᴍ ᴛʜᴇ sᴀᴍᴇ ʀᴏᴏᴍ.".light_black
    end

    def labyrinth_menu_options
        puts @title_art.yellow
        puts ""
        puts "Pick a #{'direction'.yellow}."
        puts ""
        sleep(0.02)
        puts " #{'-'.yellow} Up"
        puts ""
        sleep(0.02)
        puts " #{'-'.yellow} Down"
        puts ""
        sleep(0.02)
        puts " #{'-'.yellow} Left"
        puts ""
        sleep(0.02)
        puts " #{'-'.yellow} Right"
        puts ""
        sleep(0.02)
    end
end
