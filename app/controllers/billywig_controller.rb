require_relative '../views/billywig_view'
require_relative 'basic_controller'

class BillywigController < BasicController
  def initialize
    @view = BillywigView.new
  end

  def run
    @running = true
    while @running
      @view.billywig_menu_options
      print "#{@player.name}#{'> '.light_blue}"
      action = gets.chomp.to_i
      clear
      route_action(action)
      clear
    end
  end

  def route_action(action)
    case action
    when 1 then play_billywig
    when 2 then tutorial
    when 9 then stop
    else
      @view.invalid_option
    end
  end

  # Returns to main menu
  def stop
    @running = false
  end

  # Displays dialogue on how to play Billywig
  def tutorial
    clear
    puts @view.title_art.light_blue.blink
    line
    slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} #{@view.tutorial}", 0.010, true)
  end

  def play_billywig
    # Clears screen and initializes the game
    @playing_again = true
    while @playing_again
      clear
      @player_score = 0
      @bank_score = rand(6..9)
      puts @view.title_art.light_blue.blink
      line

      # Game loop, asks for a card, checks if it's over 21, asks if you want another card.
      while @playing_again && @player_score < 21
        puts state_of_the_game
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Tarot card? #{'y'.light_blue} or #{'yes'.light_blue} to conjure a new card", 0.002, false)
        print "#{@player.name}#{'> '.light_blue}"
        player_turn = gets.chomp.downcase
        if player_turn == "y" || player_turn == "yes"
          @player_score += pick_player_card
          ensure_no_bank_bust
        else
          @playing_again = false
        end
      end

      # Prompts player to play again
      puts end_game_message(@player_score, @bank_score)
      slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} How's about we go for another round?", 0.010, false)
      puts "#{@player.name}#{'> '.light_blue}"
      play_again = gets.chomp.downcase
      if play_again == "yes" || play_again == "y"
        @playing_again = true
      else
        @playing_again = false
      end
      line
    end
  end

    #====================================================================#

  def pick_bank_score
      [
      1, 1, 1, 1,
      2, 2, 2, 2,
      3, 3, 3, 3,
      4, 4, 4, 4,
      5, 5, 5, 5, 5,
      6, 6, 6, 6, 6,
      7, 7, 7, 7, 7,
      8, 8, 8, 8, 8,
      9, 9, 9, 9, 9,
      10, 10, 10, 10,
      11, 11, 11, 11
    ].sample
  end

  def ensure_no_bank_bust
    card = pick_bank_score
    if (@bank_score + card) <= 21
      @bank_score += card
    else
      puts ""
      puts "Gruntilda gives you the card instead...".light_black
    end
  end

  #====================================================================#

  def pick_player_card
    [
      1, 1, 1, 1, 1,
      2, 2, 2, 2, 2,
      3, 3, 3, 3, 3,
      4, 4, 4, 4, 4,
      5, 5, 5, 5, 5,
      6, 6, 6, 6,
      7, 7, 7, 7,
      8, 8, 8, 8,
      9, 9, 9, 9,
      10, 10, 10, 10, 10,
      10, 10, 10, 10, 10,
      21].sample
  end

  #====================================================================#

  def state_of_the_game
        puts ""
        puts "Gruntilda's score: #{@bank_score.to_s.light_red}"
        puts "Your score: #{@player_score.to_s.light_green}"
  end

  #====================================================================#
  # slow_dialogue(text, delay = 0.010, false) incorpoate later?

  def end_game_message(player_score, bank_score)
      @player_score = player_score
      too_many = (@player_score - 21)
      if @player_score > 21
          "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Hot ghoul, looks like ya lost NYAAKAkakaaa! You have #{@player_score.to_s.light_green} points, that's #{too_many.to_s.light_red} too many!"
      elsif @player_score == 21
          puts ""
          puts "Gruntilda's score: #{@bank_score.to_s.light_red}"
          puts "Your score: #{@player_score.to_s.cyan.blink}"
          puts ""
          puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I can't believe you got a perfect score!!!
          #{@view.billywig_art.cyan}"
          puts ""
          ""
      elsif @player_score > bank_score
          "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Meh! I guess you win... with a score of #{@player_score.to_s.light_green}."
      elsif @player_score < bank_score
          next_card_color
          puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} You would've gotten #{next_card_color} next!"
          "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Sweet mortis bats! I thought you played this before? I win!! With #{bank_score.to_s.light_red} points!"
      elsif @player_score == bank_score
          puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} You would've gotten #{next_card_color} next!"
          "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} As even as a porlock's toe nails. I guess nobody wins this round."
      end
  end

  def next_card_color
      @next_card_integer = pick_player_card
      @next_card_string = @next_card_integer.to_s
      if @next_card_integer + @player_score > 21
          @next_card_string = @next_card_string.light_red
      elsif
          @next_card_integer + @player_score == 21
          @next_card_string = @next_card_string.light_magenta
      else
          @next_card_string = @next_card_string.light_green
      end
  end
end
