require 'colorize'

# Tracks everything related to player
class Witch
  attr_accessor :name, :ladle, :cauldron, :ingredients, :recipes, :hat, :unlocked_hats, :robe, :unlocked_robes, :special_recipes

  def initialize
    @ladle = "wooden spoon"
    @cauldron = "simple cauldron"
    @ingredients = ["water"] # Start with only water
    @recipes = {
    #   "Witch's brew": ['cat hair', 'bat spleen'],
    #   "Warlock's brew": ['frog brains', 'tongue of dog'],
    #   "Time potion": ['star grass', 'toadstools'],
    #   "Potion of altered perception": ['assorted eyeballs', 'cyclops sweat'],
    #   "Potion of the arcane": ['a fairy wing', 'arcana rocks'],
    #   "Magical medley": ['mushrooms', 'pixie wings'],
    #   "Vial of corruption": ['gorgon tears', 'an ogre toenail'],
    #   "Screaming dreams": ['a moonstone', 'a mandrake'],
    #   "Flask of gills": ['octopus powder', 'ink'],
    #   "Flask of blood": ['iguana blood', 'a crocodile heart'],
    #   "Bowl of smoke and embers": ['wormwood', 'rubies'],
    #   "Tonic of transcendence": ['an owl feather', 'sage'],
    #   "Draught of secrets": ['ancient dust', 'gargoyle scales'],
    #   "Philter of desires": ['rose petals', 'ashwinder eggs'],
    #   "Brew of visions": ['newt oil', 'tarot cards'],
    #   "Spicy syrum": ['lavender', 'ginger'],
    #   "Brew of beginnings": ['water', 'small bones'],
    #   "Liquid light": ['silver', 'unicorn urine'],
    #   "Vial of knowledge": ['a chess pawn', "wizard's beard hairs"],
    #   "Slimy syrum": ['pickled slugs', 'leech juice'],
    #   "Hearing gel": ['a wyvern ear', 'werewolf fur'],
    #   "Healing salve": ['centaur arteries', 'a chimera tail'],
    #   "Appetitus increasus syrum": ['goblin gums', "a griffin's beak"],
    #   "Tincture of temptation": ['mermaid scales', 'siren vocal cords'],
    #   "Philter of unborn death": ['a harp egg', 'ghost essence'],
    #   "Vial of the Volatile": ['a dragon claw', 'aconite'],
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
