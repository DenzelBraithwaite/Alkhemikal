# require 'csv'
require_relative 'witch_model'

class WitchRepo

  def initialize
    # Create player
    @player = WitchModel.new("Name> ")
    # Array of all items that can be found while exploring.
    
    # Array of all creatable potions.
    @all_potions = [
      "Witch's Brew",
      "Warlock's Brew",
      "Time Potion",
      "Potion of Altered Perception",
      "Potion of the arcane",
      "Magical Medley",
      "Vial of Corruption",
      "Screaming Dreams",
      "Flask of Gills",
      "Flask of Blood",
      "Bowl of Smoke and Embers",
      "Tonic of Transcendence",
      "Draught of Secrets",
      "Philter of Desires",
      "Brew of Visions",
      "Spicy Syrum",
      "Brew of Beginnings",
      "Liquid Light",
      "Vial of Knowledge",
      "Slimy Syrum",
      "Vial of the Volatile"
     ] 
    # Hash of all creatable potions + their recipes
    @all_potion_recipes = {
      :"Witch's Brew" => ["cat hair", "bat spleen"],
      :"Warlock's Brew" => ["frog brain", "tongue of dog"],
      :"Time Potion" => ["star grass", "toadstools"],
      :"Potion Potion" => [
        # Any 2 potions combined
        "Witch's Brew",
        "Warlock's Brew",
        "Time Potion",
        "Potion of Altered Perception",
        "Potion of the arcane",
        "Magical Medley",
        "Vial of Corruption",
        "Screaming Dreams",
        "Flask of Gills",
        "Flask of Blood",
        "Bowl of Smoke and Embers",
        "Tonic of Transcendence",
        "Draught of Secrets",
        "Philter of Desires",
        "Brew of Visions",
        "Spicy Syrum",
        "Brew of Beginnings",
        "Liquid Light",
        "Vial of Knowledge",
        "Slimy Syrum"
      ],
      :"Potion of Altered Perception" => ["assorted eyeballs", "cyclops sweat"],
      :"Potion of the arcane" => ["fairy wing", "arcana rocks"],
      :"Magical Medley" => ["mushrooms", "pixie wings"],
      :"Vial of Corruption" => ["gorgon tears", "ogre toenail"],
      :"Screaming Dreams" => ["moonstone", "mandrake"],
      :"Flask of Gills" => ["octopus powder", "ink"],
      :"Flask of Blood" => ["iguana blood", "crocodile heart"],
      :"Bowl of Smoke and Embers" => ["star grass", "rubies"],
      :"Tonic of Transcendence" => ["owl feather", "sage"],
      :"Draught of Secrets" => ["ancient dust", "gargoyle scale"],
      :"Philter of Desires" => ["rose petals", "ashwinder eggs"],
      :"Brew of Visions" => ["newt oil", "tarot cards"],
      :"Spicy Syrum" => ["lavender", "ginger"],
      :"Brew of Beginnings" => ["water", "small bones"],
      :"Liquid Light" => ["silver", "unicorn urine"],
      :"Vial of Knowledge" => ["chess pawn", "wizard's beard hairs"],
      :"Slimy Syrum" => ["pickled slugs", "leech juice"],
      :"Vial of the Volatile" => ["dragon claw", "aconite"]
    }
    # Array of things to say when a good potion is created
    @good_potion_text = [
      "A stellar potion indeed.",
      "If you keep at it like that you'll be a master in no time.",
      "NYAAAKAKAAA that's what I'm talking about!",
      "Hmph! Not bad..",
      "Excellent work!",
      "You're a natural.",
      "I remember the first time I made that, NYAAAKAKAAA!",
      "Now you're starting to get the hang of it.",
      "A truer witch there is none, greatness flows through your veins!"
    ]
    # Array of things to say when a bad potion is created
    @bad_potion_text = [
      "Quit wasting time and make something useful.",
      "I can't imagine what anyone would do with this?",
      "NYAAAKAKAAA, you just created POOP! NYAAAAAAAAAAAAAAAAAAAKAKAKAKAKaAaaahh.. Now clean the cauldron",
      "Umm.... I think it's safe to say we don't need this",
      "Are you even trying???",
      "You can't use just any ingredients silly witch.",
      "Throw that away now!",
      "Sweet Mortis! I can't remember the last time I saw a potion that bad..",
      "Yet another failure...",
      "What is that? A cure for boils? YEEK, give that to the cat.",
      "That 'potion' smells worse than you do, NYAAAKAKAAA!!",
      "As thick as a Wiggentree's bark aren't you? Start again!",
      "Do you have any idea what you're doing?",
      "I thought you said you were a witch.",
      "I liken that potion to a giant Glumbumble dung beetle. START OVER!!",
      "Is that an ageing potion? NYAAAK, I'll be taking that! Now then, continue.",
      "That almost looked like the Elixir of life, but even I've never managed to make that one. Start over",
      "STOOOOOOOOOOOP!!! NYAAAK, you almost made an exploding potion!!! Throw that out back and clean the cauldron well!",
      "Hmm, almost smells like polyjuice potions. That's been banned though, so try something new.",
      "Is that... Are you making a kissing concoction? I'm flattered but please take this seriously.",
      "Not even close..",
      "Nope",
      "NYAAAAAAAAAAAAAAAAAAAKAKAKAKAKaAaaahh AHAHAHAAAAA NYAAAK, that was laughable!! NYAAAKAKAAA",
      "Have you tried ... was it a heart and water or.. no a heart and some blood?",
      "One time I used silver to create Liquid Light, you'll get there",
      "Remember the Brew of Beginnings? With small bones and water, most ingredients are only used in one potion!",
      "I hear certain witches find ashwinder eggs romantic... NYAAAK, daft old cooks!",
      "Once I wanted my dreams to speak to me, so I made a screaming potion!! But then I couldn't sleep!!"
    ]
    # Hash for Final potion ingredients
    @final_potion = {:"Vile Vial of Amortentia" => ["Bowl of Smoke and Embers", "Brew of Visions", "Time Potion"]}
    # Hats that can be found when exploring
    @all_hats = [
      "pointy hat",
      "magic hood",
      "long grey wig",
      "witch's hat",
      "sorting hat",
    ]
    # RObes that can be found when exploring
    @all_robes = [
      "wizard's robe",
      "Beautifying robe",
      "dark cloak",
      "witch's robe",
      "Quidditch uniform",
    ]
    @art_recipes = "
    ██████╗░███████╗░█████╗░██╗██████╗░███████╗░██████╗
    ██╔══██╗██╔════╝██╔══██╗██║██╔══██╗██╔════╝██╔════╝
    ██████╔╝█████╗░░██║░░╚═╝██║██████╔╝█████╗░░╚█████╗░
    ██╔══██╗██╔══╝░░██║░░██╗██║██╔═══╝░██╔══╝░░░╚═══██╗
    ██║░░██║███████╗╚█████╔╝██║██║░░░░░███████╗██████╔╝
    ╚═╝░░╚═╝╚══════╝░╚════╝░╚═╝╚═╝░░░░░╚══════╝╚═════╝░"
    @art_potions = "
    ██████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗██╗
    ██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝██║
    ██████╔╝██║░░██║░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░██║
    ██╔═══╝░██║░░██║░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗╚═╝
    ██║░░░░░╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝██╗
    ╚═╝░░░░░░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░╚═╝"
    @art_crafting = "
    ░█████╗░██████╗░░█████╗░███████╗████████╗██╗███╗░░██╗░██████╗░
    ██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██║████╗░██║██╔════╝░
    ██║░░╚═╝██████╔╝███████║█████╗░░░░░██║░░░██║██╔██╗██║██║░░██╗░
    ██║░░██╗██╔══██╗██╔══██║██╔══╝░░░░░██║░░░██║██║╚████║██║░░╚██╗
    ╚█████╔╝██║░░██║██║░░██║██║░░░░░░░░██║░░░██║██║░╚███║╚██████╔╝
    ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░"
    @art_ingredients = "
    ██╗███╗░░██╗░██████╗░██████╗░███████╗██████╗░██╗███████╗███╗░░██╗████████╗░██████╗
    ██║████╗░██║██╔════╝░██╔══██╗██╔════╝██╔══██╗██║██╔════╝████╗░██║╚══██╔══╝██╔════╝
    ██║██╔██╗██║██║░░██╗░██████╔╝█████╗░░██║░░██║██║█████╗░░██╔██╗██║░░░██║░░░╚█████╗░
    ██║██║╚████║██║░░╚██╗██╔══██╗██╔══╝░░██║░░██║██║██╔══╝░░██║╚████║░░░██║░░░░╚═══██╗
    ██║██║░╚███║╚██████╔╝██║░░██║███████╗██████╔╝██║███████╗██║░╚███║░░░██║░░░██████╔╝
    ╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═════╝░"
    @art_witch = '                            
    (       "     )     
     ( _  *         
        * (     /      \    ___                
           "     "        _/ /                 
          (   *  )    ___/   |                 
            )   "     _ o)\'-./__               
           *  _ )    (_, . $$$                 
           (  )   __ __ 7_ $$$$                
            ( :  { _)  \'---  $\                
       ______\'___//__\   ____, \               
        )           ( \_/ _____\_              
      .\'             \   \------\'\'.            
      |=\'           \'=|  |         )           
      |               |  |  .    _/            
       \    (. ) ,   /  /__I_____\             
     \'._/_)_(\__.\'   (__,(__,_]             
       @---()_.\'---@  '
      #  @save_file = "save_file.csv"
      #  load
  end

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



end

# Final potion, reveals why Elisa is stinky. requiers witch's cauldron
# Checks to see if she has the cauldron, then if ingredients are right it makes it.
