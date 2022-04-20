require_relative '../views/main_view'

class MainController < ParentController
  def initialize
    super(player)
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

  # Displays tutorial on each menu option.
  def tutorial
    clear
    puts @view.title_art.cyan.blink
    line
    slow_dialogue("#{@view.tutorial_message}", 0.010, true)
  end
end
