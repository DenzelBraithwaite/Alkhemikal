class Witch
	attr_accessor :name, :ladle, :cauldron, :ingredients, :recipes, :hat, :unlocked_hats, :robe, :unlocked_robes
	
	def initialize
		@ladle = "wooden spoon"
		@cauldron = "simple cauldron"
		@ingredients = ["water", "small bones"] # REMOVE SMALL BONES
		@recipes = {}
		@unlocked_hats = ["none"]
		@unlocked_robes = ["simple black robe"]
		@hat = @unlocked_hats.first
		@robe = @unlocked_robes.first
	end

	# Instead of making dedicated repos, I will store player equipment here
    # Hats that can be found when exploring
    @all_hats = [
		"pointy hat",
		"magic hood",
		"long grey wig",
		"witch's hat",
		"sorting hat",
		"short purple wig",
		"sacred crown"
    ]

    # Robes that can be found when exploring
    @all_robes = [
		"peasant robe",
		"wizard's robe",
		"Beautifying robe",
		"dark cloak",
		"witch's robe",
		"Quidditch uniform",
		"Wings of freedom cloak",
		"magic cape"
    ]

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
		@ladle = "Witch's broom"
	end

	# Method that upgrades cauldron after all basic potions have been created.
	def upgrade_cauldron
		@cauldron = "Large witch's cauldron"
	end



















end