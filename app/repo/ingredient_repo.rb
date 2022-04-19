# List of all ingredients found when exploring
class IngredientRepo
  attr_reader :good_ingredients, :bad_ingredients
  attr_accessor :all_ingredients

  def initialize
    # Array of all items that can be found while exploring.
    @all_ingredients = [
      'a beetle eye',
      'a billywig stinger',
      'a caterpillar',
      'a chess pawn',
      'a chimera tail',
      'a cockroach',
      'a crocodile heart',
      'a dead puffer fish',
      'a dragon claw',
      'a fairy wing',
      "a frog's toe",
      "a griffin's beak",
      'a griffin claw',
      'a harpy egg',
      'a hermit crab shell',
      'a horned slug',
      'a baby basilisk',
      "a lizard's leg",
      'a mandrake',
      'a moonstone',
      'a rat tail',
      'a snake fang',
      'a turtle',
      'a wolf tooth',
      'a wyvern ear',
      'an old billywig card',
      'aconite',
      'alcohol',
      'an avocado',
      'an ogre toenail',
      'an old wooden chair',
      'an owl feather',
      'ancient dust',
      'arcana rocks',
      'ashwinder eggs',
      'assorted eyeballs',
      'bat ears',
      'bat spleen',
      'bitter roots',
      'blood',
      'cat hair',
      'centaur arteries',
      'chicken lips',
      'crowbane',
      'cyclops sweat',
      'death caps',
      'dragon dung',
      'fluxweed',
      'frog brains',
      'gargoyle scales',
      'ghost essence',
      'ginger',
      'goblin gums',
      'gold',
      'gorgon tears',
      'haunted wood',
      'horse hair',
      'iguana blood',
      'ink',
      'kelp',
      'lavender',
      'living rocks',
      'leech juice',
      'mermaid scales',
      'merman scales',
      'mushrooms',
      'newt oil',
      'newt spleen',
      'octopus powder',
      'pearl dust',
      'pickled slugs',
      'pixie wings',
      'plantain',
      'rose petals',
      'rubies',
      'sage',
      'salt',
      'silver',
      'siren vocal cords',
      'small bones',
      'snake skin',
      'spiders',
      'star grass',
      'tarot cards',
      'toadstools',
      'tongue of dog',
      'unicorn urine',
      'volcanic ash',
      'werewolf fang',
      'werewolf fur',
      "wizard's beard hairs",
      'wormwood',
      # Special findings
      "a damaged recipe: #{"Witch's Brew".cyan} => ['#{"cat hair".light_cyan}', 'b-']",
      "a damaged recipe: #{"Warlock's Brew".cyan} => ['#{"frog brain".light_cyan}', 't---u- -- d--']",
      "a damaged recipe that references the #{'forbidden'.red} potion..."
    ]
    # Array of good ingredients found while exploring
    @good_ingredients = [
      'a chess pawn',
      'a chimera tail',
      'a crocodile heart',
      'a dragon claw',
      'a fairy wing',
      "a griffin's beak",
      'a harpy egg',
      'a mandrake',
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
    # Array of bad ingredients found while exploring, confirm if I need this
    # @bad_ingredients = [
    #   "alcohol",
    #   "avocado",
    #   "beetle eye",
    #   "billywig stinger",
    #   "bitter root",
    #   "blood",
    #   "caterpillar",
    #   "chicken lips",
    #   "cockroach",
    #   "death cap",
    #   "crowbane",
    #   "dragon dung",
    #   "snake skin",
    #   "fluxweed",
    #   "griffin claw",
    #   "hermit crab shell",
    #   "horned slug",
    #   "horse hair",
    #   "kelp",
    #   "lizard's leg",
    #   "newt spleen",
    #   "pearl dust",
    #   "plantain",
    #   "dead puffer fish",
    #   "rat tail",
    #   "snake fang",
    #   "salt",
    #   "spiders",
    #   "frog's toe",
    #   "wolf tooth",
    #   "turtle",
    #   "spectacles",
    #   "wormwood",
    #   "photo of Elisa",
    #   "broken glass",
    #   "water",
    #   "zephyr extract",
    #   "damaged pipe",
    #   "fractured vape",
    #   "special grass",
    #   "damaged recipe: Witch's Brew => ['cat hair', 'b-']",
    #   "damaged recipe: Warlock's Brew => ['frog brain', 't---u- -- d--']",
    #   "\nKaz's journal:\n Year - 1743\n Moon: Garnet,\nIt reads: I've almost figured it out... the vial or Amortentia. I've tried and failed so many times,
    #   but this moon will be different.\n I've discovered that the key ingredient isn't an ingredient at all, it's a potion!!
    #   In fact all the ingredients are potions.\n This is my hypothesis, if you combine the Brew of visions w-"
    # ]
  end
end
