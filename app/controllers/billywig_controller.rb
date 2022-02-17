class BillywigController
    #====================================================================#
    #----------------------Billywig_minigame----------------------------#
    #====================================================================#
    def run
        clear
        # loading <-- loading screen
        puts "
        ██████╗░██╗██╗░░░░░██╗░░░░░██╗░░░██╗░██╗░░░░░░░██╗██╗░██████╗░██╗
        ██╔══██╗██║██║░░░░░██║░░░░░╚██╗░██╔╝░██║░░██╗░░██║██║██╔════╝░██║
        ██████╦╝██║██║░░░░░██║░░░░░░╚████╔╝░░╚██╗████╗██╔╝██║██║░░██╗░██║
        ██╔══██╗██║██║░░░░░██║░░░░░░░╚██╔╝░░░░████╔═████║░██║██║░░╚██╗╚═╝
        ██████╦╝██║███████╗███████╗░░░██║░░░░░╚██╔╝░╚██╔╝░██║╚██████╔╝██╗
        ╚═════╝░╚═╝╚══════╝╚══════╝░░░╚═╝░░░░░░╚═╝░░░╚═╝░░╚═╝░╚═════╝░╚═╝".light_blue.blink
        line
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Let's play some Billywig!!", delay = 0.015, false)
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} I'm assuming you've played before? I believe it's similar to what the muggles refer to as 'black jack'.", delay = 0.015, false) 
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} But there's a twist...NYAAAAKAKAKAAA!!!", delay = 0.015, false)
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} There's 1 card that's worth 21 all by itself!! I'll let you discover the other differences while playing.", delay = 0.015, false)
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} I wish you all the worst luck, now Lets. Play. Some. BILLYWIIIIIIG!", delay = 0.015, false)
        
        playing_again = true
    
        while playing_again == true
        playing = true
        player_score = 0
        bank_score = pick_bank_score
        while playing && player_score < 21 
            slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Tarot card? #{'y'.light_blue} or #{'yes'.light_blue} to conjure a new card", delay = 0.015, false)
            print "#{WITCH_NAME}> ".yellow
            player_turn = input
            
            if player_turn == "y" || player_turn == "yes"
            player_score += pick_player_card
            puts state_of_the_game(player_score, bank_score)
            else
            playing = false
            end
        end
    
        puts end_game_message(player_score, bank_score)
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} How's about we go for another round?", delay = 0.015, false)
        puts "#{WITCH_NAME}> ".yellow
        play_again = input
        line
        if play_again == "yes" || play_again == "y"
            playing_again = true
            clear
            puts billywig_art.light_blue.blink
            line
        else
            playing_again = false
        end
        end
    end
    
    #====================================================================#
    
    def pick_bank_score
        rand(16..21)
    end
    
    #====================================================================#
    
    def pick_player_card
        [
        1, 1, 1, 1,
        2, 2, 2, 2,
        3, 3, 3, 3,
        4, 4, 4, 4,
        5, 5, 5, 5,
        6, 6, 6, 6,
        7, 7, 7, 7,
        8, 8, 8, 8,
        9, 9, 9, 9,
        10, 10, 10, 10, 10,
        10, 10, 10, 10, 10,
        11, 11,
        21].sample
    end
    
    #====================================================================#
    
    def state_of_the_game(player_score, bank_score)
        if player_score == 1
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} You have #{player_score.to_s.light_green} point, I have #{bank_score.to_s.light_red} points now.", delay = 0.015, false)
        else
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} You have #{player_score.to_s.light_green} points, I have #{bank_score.to_s.light_red} points now.", delay = 0.015, false)
        end
    end
    
    #====================================================================#
    # slow_dialogue(text, delay = 0.015, false) incorpoate later?
    
    def end_game_message(player_score, bank_score)
        if player_score > 21
        "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Hot ghoul, looks like ya lost NYAAKAkakaaa! You have #{player_score.to_s.light_green} points, that's too many, smoke!"
        elsif player_score == 21
        "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Billywig! I can't believe you got a perfect score... Give 2 puffs!"
        elsif player_score > bank_score
        "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Meh! I guess you win... with a score of #{player_score.to_s.light_green}, smoke time."
        elsif player_score < bank_score
        "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Sweet mortis bats! I thought you played this before? I win!! With #{bank_score.to_s.light_red} points, now smoke!"
        elsif player_score == bank_score
        "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} As even as a porlock's toe nails. I guess nobody wins this round, so nobody smokes."
        end
    end
        end

    private

  # Get user input lower case
  def input
    gets.chomp.downcase
  end

  # Get user input as integer
  def input_integer
    gets.chomp.to_i
  end

  # Line plus optional timer
  def line(time = 0)
    puts ""
    sleep(time.to_f)
  end

  # Clear screen
  def clear
      if Gem.win_platform?
        system 'cls'
      else
        system 'clear'
      end
  end

  def continue_prompt
    puts "𝖯𝗋𝖾𝗌𝗌 𝖾𝗇𝗍𝖾𝗋 𝗍𝗈 𝖼𝗈𝗇𝗍𝗂𝗇𝗎𝖾".light_black.blink
      input
  end

  def gruntilda_says(text)
    print "Gruntilda> ".yellow
    slow_dialogue(text, 0.015, false)
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

end
