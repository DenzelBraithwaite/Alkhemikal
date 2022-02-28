# require 'csv'
require_relative 'routers/router'
require_relative 'controllers/main_controller'
require_relative 'controllers/explore_controller'
# require_relative 'controllers/potions_controller'
require_relative 'controllers/billywig_controller'
require_relative 'controllers/maze_controller'

require_relative 'repo/maze_repo'
# require_relative 'witch_repo'

basic_controller = BasicController.new

# save_file   = File.join(__dir__, 'save_file.csv')
# witch_repo = WitchRepo.new # (save_file)

main_controller = MainController.new

explore_repo = ExploreRepo.new
explore_controller = ExploreController.new(explore_repo)

# potions_controller = PotionsController.new()
billywig_controller = BillywigController.new()

# Maze
maze_repo = MazeRepo.new
maze_controller = MazeController.new(maze_repo)

# Router
router = Router.new(basic_controller, explore_controller, main_controller, billywig_controller, maze_controller) #potions_controller

# Start the app
router.run
