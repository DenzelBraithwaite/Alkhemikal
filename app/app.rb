# require 'csv'
# save_file   = File.join(__dir__, 'save_file.csv')
require_relative 'router'

require_relative 'controllers/main_controller'
require_relative 'controllers/explore_controller'
require_relative 'controllers/potion_controller'
require_relative 'controllers/billywig_controller'
require_relative 'controllers/labyrinth_controller'

require_relative 'repo/ingredient_repo'
require_relative 'repo/potion_repo'
require_relative 'repo/labyrinth_repo'

require_relative 'models/witch'

# Related to player
player = Witch.new

# Parent controller with some useful generic methods 
basic_controller = BasicController.new(player)

# Controller for main menu
main_controller = MainController.new

# Related to 'explore' option in main menu
ingredient_repo = IngredientRepo.new
explore_controller = ExploreController.new(ingredient_repo)

# Related to 'potions' option in main menu
potion_repo = PotionRepo.new
potion_controller = PotionController.new(ingredient_repo, potion_repo)

# Related to 'Billywig' option in main menu
billywig_controller = BillywigController.new

# Related to 'labyrinth' option in main menu
labyrinth_repo = LabyrinthRepo.new
labyrinth_controller = LabyrinthController.new(labyrinth_repo)

# Router
router = Router.new(basic_controller, main_controller, explore_controller, potion_controller, billywig_controller, labyrinth_controller)

# Start the app
router.run
