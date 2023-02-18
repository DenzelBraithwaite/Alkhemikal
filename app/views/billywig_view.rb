require 'colorize'

class BillywigView
  attr_reader :title_art, :billywig_art, :tips

  def initialize
    @title_art = "
         ██████╗░██╗██╗░░░░░██╗░░░░░██╗░░░██╗░██╗░░░░░░░██╗██╗░██████╗░██╗
         ██╔══██╗██║██║░░░░░██║░░░░░╚██╗░██╔╝░██║░░██╗░░██║██║██╔════╝░██║
         ██████╦╝██║██║░░░░░██║░░░░░░╚████╔╝░░╚██╗████╗██╔╝██║██║░░██╗░██║
         ██╔══██╗██║██║░░░░░██║░░░░░░░╚██╔╝░░░░████╔═████║░██║██║░░╚██╗╚═╝
         ██████╦╝██║███████╗███████╗░░░██║░░░░░╚██╔╝░╚██╔╝░██║╚██████╔╝██╗
         ╚═════╝░╚═╝╚══════╝╚══════╝░░░╚═╝░░░░░░╚═╝░░░╚═╝░░╚═╝░╚═════╝░╚═╝"
    @billywig_art = "
    ╭┳┳╮╭╮╱╱╭╮╭╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭┳┳╮
    ┃┃┃┃┃┃╱╱┃┃┃┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃┃┃┃
    ┃┃┃┃┃╰━┳┫┃┃┃╭╮╱╭┳╮╭╮╭┳┳━━╮┃┃┃┃
    ╰┻┻╯┃╭╮┣┫┃┃┃┃┃╱┃┃╰╯╰╯┣┫╭╮┃╰┻┻╯
    ╭┳┳╮┃╰╯┃┃╰┫╰┫╰━╯┣╮╭╮╭┫┃╰╯┃╭┳┳╮
    ╰┻┻╯╰━━┻┻━┻━┻━╮╭╯╰╯╰╯╰┻━╮┃╰┻┻╯
    ╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┃╱╱╱╱╱╱╭━╯┃
    ╱╱╱╱╱╱╱╱╱╱╱╱╰━━╯╱╱╱╱╱╱╰━━╯"
    @tips = [
      "Keep pressing #{"'".light_blue}enter#{"'".light_blue} in a menu to cycle through the tips #{'/'.light_blue} hints#{'.'.light_blue}",
      "There's one card in the deck that's worth 26 points alone!",
      "If you get 6 cards under 26, you win 3 times your bet!! Although, it won't happen very often so don't hold your breath.",
      "Gruntilda cheats, so if she's ever going to draw a card that will make her bust, she'll pass it to you instead",
      'The odds are stacked against you in this game, your best bet is to win early.',
      "You can bet even if you don't have enough gold. But you'll owe Gruntilda!",
      "If you don't want to bet anything, just press 'enter'.",
      "Legend has it, billywig got it's name from those darn blue billywig pests.",
      "The ones some witches call 'muggles' created blackjack by stealing ideas from billywig!",
      "Quit while you're ahead, it's very easy to go in the hole.",
      "Not all tips are useful, most of them are, but this one isn't.",
      "If you go over 26, you'll lose twice your initial bet, so you better be sure before taking another card!",
      "If you get exactly 26 that's a BILLYWIG!!! You'll win 5 times your initial bet!",
      "Fun fact, Billywig is a rather new game amongst witches and warlocks. It's only been around for 1 full moon cycle!",
      "There was talk about updating the game and making #{'27'.cyan.blink} the new goal... ugh, why must everything change.",
      "Some wormheads think that Billywig was played by the gods, NYAAK ka ka kaaaaa... The fools don't know the true origin.",
      "There was a magical being who passed by these woods once, he's the one who taught me BIllywig. It wasn't the gods or whomever else you might hear...",
      "Ahh... how Billywig reminds me of a certain someone."
    ]
  end

  def tutorial
    "Lᴇᴛ's ᴘʟᴀʏ sᴏᴍᴇ Bɪʟʟʏᴡɪɢ!!\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_blue} I'm assuming you've played before? I believe it's similar to what the muggles refer to as 'black jack'.\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_blue} But there's a twist...NYAAAAKAKAKAAA!!! The goal is to get to 26, not 21!\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_blue} There's 1 card that's worth 26 all by itself!! I'll let you discover the other differences while playing.\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_blue} Because I'm such an amazingly generous, beautiful and talented witch, if we tie I'll let you win!.\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_blue} I wish you all the worst luck, now Lets. Play. Some. BILLYWIIIIIIG!\n
    #{'Gʀᴜɴᴛɪʟᴅᴀ>'.light_blue} One last thing, we're gambling witches here, so don't play if you ain't got any #{'GOLD'.yellow}! NYAAkakakakaaa \n"
  end

  def place_bet(gold)
    print 'Tip: '.light_blue
    puts @tips.sample
    puts ''
    puts @title_art.light_blue.blink
    puts ''
    puts " Pʟᴀᴄᴇ ʏᴏᴜʀ ʙᴇᴛs #{'!'.light_blue}"
    puts ''
    sleep(0.05)
    puts " １ #{'-'.light_blue} #{'5G'.yellow}"
    puts ''
    sleep(0.05)
    puts " ２ #{'-'.light_blue} #{'20G'.yellow}"
    puts ''
    sleep(0.05)
    puts " ３ #{'-'.light_blue} #{'50G'.yellow}"
    puts ''
    sleep(0.05)
    puts " ４ #{'-'.light_blue} #{'100G'.yellow}"
    puts ''
    puts "Your gold: #{gold.to_s.yellow}#{'G'.yellow}"
    puts ''
  end

  def billywig_menu_options
    print 'Tip: '.light_blue
    puts @tips.sample
    puts ''
    puts title_art.light_blue.blink
    puts ''
    puts " Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ #{'?'.light_blue}"
    puts ''
    sleep(0.05)
    puts " 𝟙 #{'-'.light_blue} ℙ𝕝𝕒𝕪"
    puts ''
    sleep(0.05)
    puts " 𝟚 #{'-'.light_blue} 𝕋𝕦𝕥𝕠𝕣𝕚𝕒𝕝"
    puts ''
    sleep(0.05)
    puts " 𝟡 #{'-'.light_blue} #{'𝔹𝕒𝕔𝕜'.light_red}"
    puts ''
    sleep(0.05)
    puts ''
  end

  # Displays what card you drew
  def you_drew(next_card, card_amount)
    puts ''
    puts "#{'Draw'.light_blue} a card to begin" unless next_card
    if next_card
      puts "You drew #{next_card.to_s.light_blue}"
      puts "#{'-'.light_blue}"
      puts "You have #{card_amount.to_s.light_blue} cards." unless card_amount == 1 || card_amount == 0
      puts "You have #{card_amount.to_s.light_blue} card now." if card_amount == 1
    end
    puts ''
  end

  # Text displayed birefly when an invalid option is entered.
  def invalid_option
    puts @title_art.light_blue.blink
    puts ''
    puts "Pʟᴇᴀsᴇ sᴇʟᴇᴄᴛ ᴀ ᴠᴀʟɪᴅ ᴏᴘᴛɪᴏɴ".light_red
    sleep(0.75)
  end

  # Text displayed to prompt play again
  def play_again(player_name)
    sleep(2)
    puts ''
    puts '---------------------------------------------------------------------------'.light_blue
    puts ''
    puts "Fᴇᴇʟɪɴɢ ʟᴜᴄᴋʏ#{'?'.light_blue} Hᴏᴡ ᴀʙᴏᴜᴛ ᴀɴᴏᴛʜᴇʀ ʀᴏᴜɴᴅ#{'?'.light_blue}"
    puts ''
    puts "𝟙 #{'-'.light_blue} ℙ𝕝𝕒𝕪 𝕒𝕘𝕒𝕚𝕟"
    puts ''
    puts "𝟡 #{'-'.light_blue} #{'𝕤𝕥𝕠𝕡'.light_red}"
    puts ''
    print "#{player_name}#{'> '.light_blue}"
  end

  def end_results(player_score, bank_score)
    puts ""
    puts "Gruntilda's score: #{bank_score.to_s.light_red}"
    puts "Your score: #{player_score.to_s.cyan}"
    puts ""
  end
end
