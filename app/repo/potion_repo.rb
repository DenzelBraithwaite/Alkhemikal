# List of all potions and their ingredients
class PotionRepo
  attr_reader :all_potions, :all_potion_recipes

  def initialize
    # Array of all creatable potions.
    @all_potions = [
      "Witch's Brew",
      "Warlock's Brew",
      'Time Potion',
      'Potion of Altered Perception',
      'Potion of the arcane',
      'Magical Medley',
      'Vial of Corruption',
      'Screaming Dreams',
      'Flask of Gills',
      'Flask of Blood',
      'Bowl of Smoke and Embers',
      'Tonic of Transcendence',
      'Draught of Secrets',
      'Philter of Desires',
      'Brew of Visions',
      'Spicy Syrum',
      'Brew of Beginnings',
      'Liquid Light',
      'Vial of Knowledge',
      'Slimy Syrum',
      'Vial of the Volatile',
    ]

    # Hash of all creatable potions + their recipes
    @all_potion_recipes = {
      "Witch's Brew": ['cat hair', 'bat spleen'],
      "Warlock's Brew": ['frog brains', 'tongue of dog'],
      "Time Potion": ['star grass', 'toadstools'],
      "Potion of Altered Perception": ['assorted eyeballs', 'cyclops sweat'],
      "Potion of the arcane": ['a fairy wing', 'arcana rocks'],
      "Magical Medley": ['mushrooms', 'pixie wings'],
      "Vial of Corruption": ['gorgon tears', 'an ogre toenail'],
      "Screaming Dreams": ['a moonstone', 'a mandrake'],
      "Flask of Gills": ['octopus powder', 'ink'],
      "Flask of Blood": ['iguana blood', 'a crocodile heart'],
      "Bowl of Smoke and Embers": ['wormwood', 'rubies'],
      "Tonic of Transcendence": ['an owl feather', 'sage'],
      "Draught of Secrets": ['ancient dust', 'gargoyle scales'],
      "Philter of Desires": ['rose petals', 'ashwinder eggs'],
      "Brew of Visions": ['newt oil', 'tarot cards'],
      "Spicy Syrum": ['lavender', 'ginger'],
      "Brew of Beginnings": ['water', 'small bones'],
      "Liquid Light": ['silver', 'unicorn urine'],
      "Vial of Knowledge": ['a chess pawn', "wizard's beard hairs"],
      "Slimy Syrum": ['pickled slugs', 'leech juice'],
      "Vial of the Volatile": ['a dragon claw', 'aconite'],
      "Potion Potion": [
        # Any 3 potions combined except brew of visions
        "Witch's Brew",
        "Warlock's Brew",
        'Time Potion',
        'Potion of Altered Perception',
        'Potion of the arcane',
        'Magical Medley',
        'Vial of Corruption',
        'Screaming Dreams',
        'Flask of Gills',
        'Flask of Blood',
        'Bowl of Smoke and Embers',
        'Tonic of Transcendence',
        'Draught of Secrets',
        'Philter of Desires',
        'Spicy Syrum',
        'Brew of Beginnings',
        'Liquid Light',
        'Vial of Knowledge',
        'Slimy Syrum',
        'Vial of the Volatile'
      ],

      # Hash for Final potion
      # :"Vile Vial of Amortentia" => ["Bowl of Smoke and Embers", "Brew of Visions", "Time Potion"]
      "Vile Vial of Amortentia": ['Bowl of Smoke and Embers', 'Brew of Visions', 'Time Potion']
    }
  end
end
