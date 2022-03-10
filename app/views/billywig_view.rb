require 'colorize'

class BillywigView
  attr_reader :title_art, :billywig_art

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
  end

  def tutorial
    "Lᴇᴛ's ᴘʟᴀʏ sᴏᴍᴇ Bɪʟʟʏᴡɪɢ!!\n
    #{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I'm assuming you've played before? I believe it's similar to what the muggles refer to as 'black jack'.\n
    #{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} But there's a twist...NYAAAAKAKAKAAA!!!\n
    #{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} There's 1 card that's worth 21 all by itself!! I'll let you discover the other differences while playing.\n
    #{"Gʀᴜɴᴛɪʟᴅᴀ>".light_yellow} I wish you all the worst luck, now Lets. Play. Some. BILLYWIIIIIIG!\n"
  end

  def billywig_menu_options
    puts title_art.light_blue.blink
    puts ""
    puts " Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ #{'?'.light_blue}"
    puts ""
    sleep(0.05)
    puts " 𝟙 #{'-'.light_blue} ℙ𝕝𝕒𝕪"
    puts ""
    sleep(0.05)
    puts " 𝟚 #{'-'.light_blue} 𝕋𝕦𝕥𝕠𝕣𝕚𝕒𝕝"
    puts ""
    sleep(0.05)
    puts " 𝟡 #{'-'.light_blue} #{'𝔹𝕒𝕔𝕜'.light_red}"
    puts ""
    sleep(0.05)
    puts ""
  end

  # Text displayed birefly when an invalid option is entered.
  def invalid_option
    puts @title_art.light_blue.blink
    puts ""
    puts "Pʟᴇᴀsᴇ sᴇʟᴇᴄᴛ ᴀ ᴠᴀʟɪᴅ ᴏᴘᴛɪᴏɴ".light_red
    sleep(0.75)
  end
end
