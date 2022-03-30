require 'colorize'

class Witch
  attr_accessor :name, :ladle, :cauldron, :ingredients, :recipes, :hat, :unlocked_hats, :robe, :unlocked_robes, :special_recipes

  def initialize
    @ladle = "wooden spoon"
    @cauldron = "simple cauldron"
    # @ingredients = [
    #   "aconite",
    #   "ashwinder eggs",
    #   "arcana rocks",
    #   "bat spleen",
    #   "chess pawn",
    #   "unicorn urine",
    #   "iguana blood",
    #   "ink",
    #   "small bones",
    #   "cat hair",
    #   "crocodile heart",
    #   "dragon claw",
    #   "owl feather",
    #   "assorted eyeballs",
    #   "fairy wing",
    #   "frog brain",
    #   "ginger",
    #   "gargoyle scale",
    #   "rubies",
    #   "lavender",
    #   "leech juice",
    #   "mandrake",
    #   "moonstone",
    #   "mushrooms",
    #   "newt oil",
    #   "octopus powder",
    #   "pickled slugs",
    #   "pixie wings",
    #   "ogre toenail",
    #   "silver",
    #   "sage",
    #   "star grass",
    #   "tarot cards",
    #   "tongue of dog",
    #   "toadstools",
    #   "wizard's beard hairs",
    #   "gorgon tears",
    #   "cyclops sweat",
    #   "ancient dust",
    #   "rose petals"]
    @ingredients = ["water"] # Start with only water
    @recipes = {
      # :"Witch's Brew" => ["cat hair", "bat spleen"],
      # :"Warlock's Brew" => ["frog brain", "tongue of dog"],
      # :"Time Potion" => ["star grass", "toadstools"],
      # :"Potion of Altered Perception" => ["assorted eyeballs", "cyclops sweat"],
      # :"Potion of the arcane" => ["fairy wing", "arcana rocks"],
      # :"Magical Medley" => ["mushrooms", "pixie wings"],
      # :"Vial of Corruption" => ["gorgon tears", "ogre toenail"],
      # :"Screaming Dreams" => ["moonstone", "mandrake"],
      # :"Flask of Gills" => ["octopus powder", "ink"],
      # :"Flask of Blood" => ["iguana blood", "crocodile heart"],
      # :"Bowl of Smoke and Embers" => ["star grass", "rubies"],
      # :"Tonic of Transcendence" => ["owl feather", "sage"],
      # :"Draught of Secrets" => ["ancient dust", "gargoyle scale"],
      # :"Philter of Desires" => ["rose petals", "ashwinder eggs"],
      # :"Brew of Visions" => ["newt oil", "tarot cards"],
      # :"Spicy Syrum" => ["lavender", "ginger"],
      # :"Brew of Beginnings" => ["water", "small bones"],
      # :"Liquid Light" => ["silver", "unicorn urine"],
      # :"Vial of Knowledge" => ["chess pawn", "wizard's beard hairs"],
      # :"Slimy Syrum" => ["pickled slugs", "leech juice"],
      # :"Vial of the Volatile" => ["dragon claw", "aconite"]
    }
    @special_recipes = {}
    @unlocked_hats = ["none"]
    @unlocked_robes = ["simple black robe"]
    @hat = @unlocked_hats.first
    @robe = @unlocked_robes.first
  end

  # Adds a hat to the hat inventory, unless already owned
  def add_hat(hat)
    @unlocked_hats << hat unless @unlocked_hats.include?(hat)
  end

  # Changes hat
  def change_hat(hat)
    @hat = hat
  end

  # Adds a robe to the robes inventory, unless already owned
  def add_robe(robe)
    @unlocked_robes << robe unless @unlocked_robes.include?(robe)
  end

  # Changes robe
  def change_robe(robe)
    @robe = robe
  end

  # Method that upgrades ladle after all ingredients have been found.
  def upgrade_ladle
    puts "#{"-".magenta}"
    # sleep(2.5)
    puts "You put your #{@ladle.magenta} down."
    @ladle = "Witch's broom"
    # sleep(1)
    puts "You pick up your new ladle, a #{@ladle.magenta}!"
  end

  # Method that upgrades cauldron after all basic potions have been created.
  def upgrade_cauldron
    puts "You put your #{@cauldron.magenta} away in the basement."
    @cauldron = "Large witch's cauldron"
    # sleep(1)
    puts "You grab your new #{@cauldron.magenta} and place it over the fire."
  end
end
