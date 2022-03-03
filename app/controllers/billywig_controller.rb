require_relative '../views/billywig_view'
require_relative 'basic_controller'

class BillywigController < BasicController
  def initialize
    @running = true
    @view = BillywigView.new
  end

    def run
        @playing_again = true
        puts @view.title_art.light_blue.blink
        line
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Let's play some Billywig!!", 0.010, false)
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I'm assuming you've played before? I believe it's similar to what the muggles refer to as 'black jack'.", 0.010, false)
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} But there's a twist...NYAAAAKAKAKAAA!!!", 0.010, false)
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} There's 1 card that's worth 21 all by itself!! I'll let you discover the other differences while playing.", 0.010, false)
        # slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I wish you all the worst luck, now Lets. Play. Some. BILLYWIIIIIIG!", 0.010, false)


        while @playing_again
        @playing_again = true
        @running = true
        @player_score = 0
        bank_score = pick_bank_score
        while @running && @player_score < 21
            slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} Tarot card? #{'y'.light_blue} or #{'yes'.light_blue} to conjure a new card", 0.005, false)
            print "#{@player.name}#{'> '.light_blue}"
            player_turn = gets.chomp.downcase

            if player_turn == "y" || player_turn == "yes"
            @player_score += pick_player_card
            puts state_of_the_game(@player_score, bank_score)
            else
            @running = false
            end
        end

        puts end_game_message(@player_score, bank_score)
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} How's about we go for another round?", 0.010, false)
        puts "#{@player.name}#{'> '.light_blue}"
        playing_again = gets.chomp.downcase
        line
        if playing_again == "yes" || playing_again == "y"
            @playing_again = true
            clear
            puts @view.title_art.light_blue.blink
            line
        else
            @playing_again = false
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
        @player_score = player_score
        if @player_score == 1
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} You have #{@player_score.to_s.light_green} point, I have #{bank_score.to_s.light_red} points now.", 0.005, false)
        else
        slow_dialogue("#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} You have #{@player_score.to_s.light_green} points, I have #{bank_score.to_s.light_red} points now.", 0.005, false)
        end
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
            puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I can't believe you got a perfect score!!!
            #{@view.billywig_art.light_blue}"
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
