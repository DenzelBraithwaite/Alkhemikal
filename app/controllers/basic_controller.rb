require 'colorize'

class BasicController
  attr_accessor :player

  def initialize(player)
    @player = player
  end

  # Custom method to capitalize a word
  def capitalize(word)
    length = word.length
    beginning = word[0].upcase
    ending = word[1..length].downcase
    return beginning + ending
  end

  # Custom method to capitalize multiple words
  def capitalize_sentence(string)
    string_as_array = string.split(" ")
    string_as_array.map! { |word| capitalize(word) }
    return string_as_array.join(" ")
  end

   # Simple loading screen, finishes with 100% in green.
   def loading
    print "Loading"
    100.times do
      print "."
      sleep(0.03)
    end
    print "100%!".green
    sleep(1.5)
    clear
  end

  #Longer loading screen with optional delay
  def long_loading(delay = 4)
    print "Loading"
    40.times do
      print "."
      sleep(0.05)
    end
    sleep(delay.to_f)
    60.times do
      print "."
      sleep(0.02)
    end
    print "100%!".green
    sleep(1.5)
    clear
  end

  def fast_loading
    print "Loading"
    100.times do
      print "."
      sleep(0.01)
    end
    print "100%!".green
    sleep(1)
    clear
  end

  # Line with 2 parameters. Amount of lines and delay
  def line(time = 0, lines = 1)
    lines.times { puts "" }
    sleep(time.to_f)
  end

  # Clear screen regardless of OS
  def clear
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
  end

  # Simple blinking prompt, continues when user enters anything
  def continue_prompt
    puts "𝖯𝗋𝖾𝗌𝗌 𝖾𝗇𝗍𝖾𝗋 𝗍𝗈 𝖼𝗈𝗇𝗍𝗂𝗇𝗎𝖾".light_black.blink
      gets.chomp
  end

  def slow_dialogue(text, delay = 0.030, continue = true)
    slow_text = text.chars

    slow_text.each do |char|
      if char == "," || char == "." || char == "!"
        print char
        sleep(0.45)
      else
        print char
        sleep(delay)
      end
    end

    2.times {line(0.5)}
    if continue == true
      continue_prompt
    end
  end

  def gruntilda_says(text)
    print "Gruntilda> ".yellow
    slow_dialogue(text, 0.015, false)
  end
end

  # Will need to play with this, goal to make one save method for all (maybe hash save will be diff method)
  # def save(save_path, to_be_saved)
  #   CSV.open(save_path, "wb") do |csv|
  #     to_be_saved.each do |thing|
  #       csv << thing
  #     end
  #   end
  # end

  # # Will need to play with this, goal to make one load method for all (maybe hash load will be diff method)
  # def load(load_path, to_be_loaded)
  #   CSV.foreach(load_path) do |row|
  #     to_be_loaded << row
  #   end
  # end
