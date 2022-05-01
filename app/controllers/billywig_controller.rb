require_relative '../views/billywig_view'

class BillywigController < ParentController
  def initialize
    super(player)
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
    slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_blue} #{@view.tutorial}", 0.010, true)
  end

  # Clears screen and initializes the game
  def play_billywig
    @playing_again = true
    while @playing_again
      clear
      @next_card = nil
      @player_card_amount = 0
      @player_score = 0
      @bank_score = rand(6..9)
      set_bet
      clear
      print 'Tip: '.light_blue
      puts @view.tips.sample
      puts ''
      puts @view.title_art.light_blue.blink
      line
      puts "Your bet: #{@bet.to_s.yellow}#{'G'.yellow}"

      # Game loop, asks for a card, checks if it's over 26, asks if you want another card.
      while @playing_again && @player_score < 26 && @player_card_amount < 6
        puts state_of_the_game
        slow_dialogue("#{'Gʀᴜɴᴛɪʟᴅᴀ> '.light_blue}Press #{'enter'.light_cyan} to conjure a new card, anything else will make you #{'hold'.light_red}.", 0.002, false)
        print "#{@player.name}#{'> '.light_blue}"
        player_hit_or_hold = gets.chomp.downcase
        if player_hit_or_hold.empty?
          @next_card = pick_player_card
          @player_score += @next_card
          @player_card_amount += 1
          ensure_no_bank_bust
        else
          @playing_again = false
          @next_card = pick_player_card
        end
      end

      # Prompts player to play again
      puts end_game_message(@player_score, @bank_score)
      puts @view.play_again(@player.name)
      play_again = gets.chomp.to_i
      if play_again == 1
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
      3, 3, 3,
      3, 3, 3,
      4, 4, 4,
      4, 4, 4,
      5, 5, 5, 5,
      6, 6, 6, 6,
      7, 7, 7, 7,
      8, 8, 8, 8, 8,
      9, 9, 9, 9, 9,
      10, 10, 10, 10,
      11, 11, 11, 11,
      16
    ].sample
  end

  def ensure_no_bank_bust
    card = pick_bank_score
    if (@bank_score + card) <= 26
      @bank_score += card
    else
      puts ''
      puts "Gruntilda gives you the card instead...".light_black
    end
  end

  #====================================================================#

  def six_cards_under_26?
    @player_card_amount >= 6
  end

  def pick_player_card
    [
      0,
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
      26
    ].sample
  end

  #====================================================================#

  def state_of_the_game
    puts ''
    puts @view.you_drew(@next_card, @player_card_amount)
    puts "Gruntilda's score: #{@bank_score.to_s.light_red}"
    puts "Your score: #{@player_score.to_s.light_green}"
  end

  #====================================================================#

  def end_game_message(player_score, bank_score)
    winning_bet = (@bet * 2)
    billywig = (@bet * 5)
    six_under = (@bet * 3)
    @player_score = player_score
    too_many = (@player_score - 26)
    if @player_score > 26
      @player.gold -= winning_bet
      @player.gold += (winning_bet / 2) if @player.current_robe == "Quidditch uniform"
      puts @view.end_results(@player_score, @bank_score)
      "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_blue} Hot ghoul, looks like ya lost NYAAKAkakaaa! You have #{@player_score.to_s.light_green} points, that's #{too_many.to_s.light_red} too many!"
      puts "You #{'lost'.red} #{winning_bet.to_s.yellow}#{'G'.yellow}"
    elsif @player_score == 26
      @player.gold += billywig
      @player.gold += billywig if @player.current_robe == "avocado onesie"
      puts @view.end_results(@player_score, @bank_score)
      puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_blue} I can't believe you got a perfect score!!!
      #{@view.billywig_art.cyan}"
      puts "You #{'won'.cyan} #{billywig.to_s.yellow}#{'G'.yellow}"
      puts ''
      puts ''
    elsif six_cards_under_26?
      @player.gold += six_under
      @player.gold += six_under if @player.current_robe == "avocado onesie"
      puts @view.end_results(@player_score, @bank_score)
      puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_blue} NYAK, #{'6 cards under 26?'.light_magenta} You must be cheating#{'...'.light_magenta}"
      puts "You #{'won'.cyan} #{six_under.to_s.yellow}#{'G'.yellow}"
    elsif @player_score > bank_score
      @player.gold += winning_bet
      @player.gold += winning_bet if @player.current_robe == "avocado onesie"
      puts @view.end_results(@player_score, @bank_score)
      "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_blue} Meh! I guess you win... with a score of #{@player_score.to_s.light_green}."
      puts "You #{'won'.cyan} #{winning_bet.to_s.yellow}#{'G'.yellow}"
    elsif @player_score < bank_score
      @player.gold -= @bet
      @player.gold += (@bet / 2) if @player.current_robe == "Quidditch uniform"
      next_card_color
      puts @view.end_results(@player_score, @bank_score)
      puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_blue} You would've gotten #{next_card_color} next!"
      puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_blue} Sweet mortis bats! I thought you played this before? I win!! With #{bank_score.to_s.light_red} points!"
      "You #{'lost'.red} #{@bet.to_s.yellow}#{'G'.yellow}"
    elsif @player_score == bank_score
      puts @view.end_results(@player_score, @bank_score)
      puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_blue} You would've gotten #{next_card_color} next!"
      puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_blue} As even as a porlock's toe nails. I guess nobody wins this round."
      "You #{'kept'.light_black} your #{@bet.to_s.yellow}#{'G'.yellow}"
    end
  end

  # Confirms bet is valid
  def set_bet
    valid_bets = [0, 5, 20, 50, 100]
    @view.place_bet(@player.gold)
    print "#{@player.name}#{'> '.light_blue}"
    @bet = gets.chomp.to_i
    until valid_bets.include?(@bet)
      clear
      @view.invalid_option
      clear
      @view.place_bet(@player.gold)
      print "#{@player.name}#{'> '.light_blue}"
      @bet = gets.chomp.to_i
    end
  end

  def next_card_color
    @next_card_integer = @next_card
    @next_card_string = @next_card_integer.to_s
    if @next_card_integer + @player_score > 26
      @next_card_string = @next_card_string.light_red
    elsif
      @next_card_integer + @player_score == 26
      @next_card_string = @next_card_string.light_magenta
    else
      @next_card_string = @next_card_string.light_green
    end
  end
end
