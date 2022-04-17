# List of all potions and their ingredients
class PotionRepo
  attr_reader :all_potions, :all_potion_recipes

  def initialize
    # Array of all creatable potions.
    @all_potions = [
      "Witch's brew",
      "Warlock's brew",
      'Time potion',
      'Potion of altered perception',
      'Potion of the arcane',
      'Magical medley',
      'Vial of corruption',
      'Screaming dreams',
      'Flask of gills',
      'Flask of blood',
      'Bowl of smoke and embers',
      'Tonic of transcendence',
      'Draught of secrets',
      'Philter of desires',
      'Brew of visions',
      'Spicy syrum',
      'Brew of beginnings',
      'Liquid light',
      'Vial of knowledge',
      'Slimy syrum',
      'Vial of the volatile',
      'Hearing gel',
      'Healing salve',
      'Appetitus increasus syrum',
      'Tincture of temptation',
      'Philter of unborn death'
    ]

    # Hash of all creatable potions + their recipes
    @all_potion_recipes = {
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
      "Brew of visions": ['newt oil', 'tarot cards'],
      "Spicy syrum": ['lavender', 'ginger'],
      "Brew of beginnings": ['water', 'small bones'],
      "Liquid light": ['silver', 'unicorn urine'],
      "Vial of knowledge": ['a chess pawn', "wizard's beard hairs"],
      "Slimy syrum": ['pickled slugs', 'leech juice'],
      "Hearing gel": ['a wyvern ear', 'werewolf fur'],
      "Healing salve": ['centaur arteries', 'a chimera tail'],
      "Appetitus increasus syrum": ['goblin gums', "a griffin's beak"],
      "Tincture of temptation": ['mermaid scales', 'siren vocal cords'],
      "Philter of unborn death": ['a harp egg', 'ghost essence'],
      "Vial of the Volatile": ['a dragon claw', 'aconite'],
      "Potion Potion": [
        # Any 3 potions combined except brew of visions
        "Witch's brew",
        "Warlock's brew",
        'Time potion',
        'Potion of altered perception',
        'Potion of the arcane',
        'Magical medley',
        'Vial of corruption',
        'Screaming dreams',
        'Flask of gills',
        'Flask of blood',
        'Bowl of smoke and embers',
        'Tonic of transcendence',
        'Draught of secrets',
        'Philter of desires',
        'Spicy syrum',
        'Brew of beginnings',
        'Liquid light',
        'Vial of knowledge',
        'Slimy syrum',
        'Vial of the volatile',
        'Hearing gel',
        'Healing salve',
        'Appetitus increasus syrum',
        'Tincture of temptation',
        'Philter of unborn death'
      ],

      # Hash for Final potion
      "Vile Vial of Amortentia": ['Bowl of smoke and embers', 'Brew of visions', 'Time potion']
    }
  end
end
