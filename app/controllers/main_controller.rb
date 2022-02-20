# require_relative '../models/witch_model'
require_relative '../views/main_view'
require_relative 'basic_controller'

class MainController < BasicController
  def initialize
    # @repo = repo
    @view = MainView.new
  end

  # First loading screen when running app
  def first_loading_screen
    long_loading
    4.times do
      puts @view.title_art.light_blue
      sleep(0.1)
      clear
    end

    6.times do
      puts @view.title_art.light_blue
      puts @view.witch_art.magenta
      sleep(0.1)
      clear
    end

    puts @view.title_art.light_blue
    puts @view.witch_art.magenta.blink
    sleep(2)
    print "For Elisa, "
    sleep(1.5)
    print "happy birthday"
    3.times do
      sleep(0.5)
      print "!".magenta.blink
    end
    line(2)
    continue_prompt
    clear
  end
end
