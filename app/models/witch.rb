class WitchModel
	attr_accessor :name, :ladle, :cauldron, :ingredients, :potions, :hat, :hats, :robe, :robes
	
	# I can call input on name ()gets.chomp.downcase!
	def initialize(name)
		@name = name
		@ladle = "wooden spoon"
		@cauldron = "simple cauldron"
		@ingredients = ["water"]
		@potions = []
		@hat = "no hat"
		@hats
		@robe = "simple black robe"
		@robes = ["simple black robe"]
	end

	# Method to change name
	def change_name(new_name)
		@name = new_name
	end

	# Method that adds ingredient to the ingredients inventory, unless already owned
	def add_ingredient(ingredient)
		@ingredients << ingredient unless @ingredients.include?(ingredient)
	end

	# Method that adds a potion to the potions inventory, unless already created.
	def add_potion(potion)
		@potions << potion unless @potions.include?(potion)
	end

	# Method that adds a hat to the hat inventory, unless already owned
	def add_hat(hat)
		@hat << potion unless @hat.include?(hat)
	end

	def change_hat(hat)
		@hat = hat
	end

	def add_robe(robe)
		@robe << robe unless @robe.include?(robe)
	end

	def change_robe(robe)
		@robe = robe
	end

	# Method that upgrades ladle after all ingredients have been found.
	def upgrade_ladle
		@ladle = "Witch's broom"
	end

	# Method that upgrades cauldron after all basic potions have been created.
	def upgrade_cauldron
		@cauldron = "Large witch's cauldron"
	end



















end