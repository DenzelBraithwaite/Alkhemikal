class PotionRepo
  attr_reader :all_potions, :all_potion_recipes

  def initialize
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
      "Vial of the Volatile",
    ] 
    # Special potions requiring different equipment
    @special_potions = [
      "potion potion",
      "vile vial of amortentia"
    ]
    
    # Hash for Final potion ingredients
    @final_potion = {:"Vile Vial of Amortentia" => ["Bowl of Smoke and Embers", "Brew of Visions", "Time Potion"]}
    
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
  end
end

	