# require 'csv'
require_relative 'main_router'
require_relative 'main_controller'
require_relative 'witch_repo'

# save_file   = File.join(__dir__, 'save_file.csv')
witch_repo = WitchRepo.new # (save_file)
controller = MainController.new(witch_repo)

# Main router
main_router = MainRouter.new(controller)

# Start the app
main_router.run

























# Nothing below this, end of game!!