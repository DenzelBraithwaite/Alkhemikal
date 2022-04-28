require 'colorize'

# Tracks everything related to player
class Witch
  attr_accessor :name, :ladle, :cauldron, :ingredients, :recipes, :purchased_bad_ingredients,
                :current_hat, :hats, :current_robe, :robes, :special_recipes, :gold, :purchased_bad_potions

  def initialize
    @gold = 2000
    @purchased_bad_ingredients = false
    @purchased_bad_potions = false
    @ladle = 'wooden spoon'
    @cauldron = 'simple cauldron'
    @ingredients = ['water']
    @recipes = {
      "Witch's brew": ['cat hair', 'bat spleen'],
      "Warlock's brew": ['frog brains', 'tongue of dog'],
      "Time potion": ['star grass', 'toadstools'],
      "Potion of altered perception": ['assorted eyeballs', 'cyclops sweat'],
      "Potion of the arcane": ['a fairy wing', 'arcana rocks'],
      "Magical medley": ['mushrooms', 'pixie wings'],
      "Vial of corruption": ['gorgon tears', 'an ogre toenail'],
      "Screaming dreams": ['a moonstone', 'a mandrake'],
      "Flask of gills": ['octopus powder', 'ink'],
      "Flask of blood": ['iguana blood', 'a crocodile heart'],
      "Bowl of smoke and embers": ['wormwood', 'rubies'],
      "Tonic of transcendence": ['an owl feather', 'sage'],
      "Draught of secrets": ['ancient dust', 'gargoyle scales'],
      "Philter of desires": ['rose petals', 'ashwinder eggs'],
      "Hearing gel": ['a wyvern ear', 'werewolf fur'],
      "Healing salve": ['centaur arteries', 'a chimera tail'],
      "Appetitus increasus syrum": ['goblin gums', "a griffin's beak"],
      "Tincture of temptation": ['mermaid scales', 'siren vocal cords'],
      "Philter of unborn death": ['a harp egg', 'ghost essence'],
      "Vial of the volatile": ['a dragon claw', 'aconite'],
    }
    @special_recipes = {}
    @hats = ["none"]
    @robes = ["simple black robe"]
    @current_hat = @hats.first
    @current_robe = @robes.first
  end

  # Adds a hat to the hat inventory, unless already owned
  def add_hat(hat)
    @hats << hat unless @hats.include?(hat)
  end

  # Changes hat
  def change_hat(hat)
    @current_hat = hat
  end

  # Adds a robe to the robes inventory, unless already owned
  def add_robe(robe)
    @robes << robe unless @robes.include?(robe)
  end

  # Changes robe
  def change_robe(robe)
    @current_robe = robe
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
