class InventoryView < MainView
    def initialize
      @title_art = "
      ██╗███╗░░██╗██╗░░░██╗███████╗███╗░░██╗████████╗░█████╗░██████╗░██╗░░░██╗
      ██║████╗░██║██║░░░██║██╔════╝████╗░██║╚══██╔══╝██╔══██╗██╔══██╗╚██╗░██╔╝
      ██║██╔██╗██║╚██╗░██╔╝█████╗░░██╔██╗██║░░░██║░░░██║░░██║██████╔╝░╚████╔╝░
      ██║██║╚████║░╚████╔╝░██╔══╝░░██║╚████║░░░██║░░░██║░░██║██╔══██╗░░╚██╔╝░░
      ██║██║░╚███║░░╚██╔╝░░███████╗██║░╚███║░░░██║░░░╚█████╔╝██║░░██║░░░██║░░░
      ╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░"
      @hats_art = "
      ██╗░░██╗░█████╗░████████╗░██████╗
      ██║░░██║██╔══██╗╚══██╔══╝██╔════╝
      ███████║███████║░░░██║░░░╚█████╗░
      ██╔══██║██╔══██║░░░██║░░░░╚═══██╗
      ██║░░██║██║░░██║░░░██║░░░██████╔╝
      ╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═════╝░"
      @robes_art = "
      ██████╗░░█████╗░██████╗░███████╗░██████╗
      ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝
      ██████╔╝██║░░██║██████╦╝█████╗░░╚█████╗░
      ██╔══██╗██║░░██║██╔══██╗██╔══╝░░░╚═══██╗
      ██║░░██║╚█████╔╝██████╦╝███████╗██████╔╝
      ╚═╝░░╚═╝░╚════╝░╚═════╝░╚══════╝╚═════╝░"
      @witch_hat_art = '
                .
              /:\
              /;:.\
            //;:. \
            ///;:.. \
      __--"////;:... \"--__
      --__   "--_____--"__--
        """--_______--"""'
      @witch_robe_art = "
                    .--.
                  ,-\"  \"-,
                  /|\\____/|\\
                / \\__  __/ \\
                './ \\    / \\.'
                    )  (
                    /    \\
                  ;      ;
                  |      |
                  |      |
                  |______|"

      @hat_hints = ["Iғ ʏᴏᴜ ᴇɴᴛᴇʀ sᴏᴍᴇᴛʜɪɴɢ ɪɴᴠᴀʟɪᴅ, ʏᴏᴜ'ʟʟ ᴘᴜᴛ ᴏɴ ᴛʜᴇ ʟᴀsᴛ ʜᴀᴛ ʏᴏᴜ ғᴏᴜɴᴅ.",
                "Eɴᴛᴇʀ ᴀ ɴᴜᴍʙᴇʀ, ɴᴏᴛ ᴛʜᴇ ɴᴀᴍᴇ ᴏғ ᴛʜᴇ ʜᴀᴛ.",
                "Fᴀɴᴄʏ ᴀ ɴɪᴄᴇ ʜᴀᴛ? Wᴇᴀʀ ᴏɴᴇ! Bᴜᴛ ᴅᴏɴ'ᴛ ᴇxᴘᴇᴄᴛ ᴀɴʏ ᴍᴀɢɪᴄ ᴇɴʜᴀᴄɪɴɢ ᴇғғᴇᴄᴛs ᴏʀ ᴀɴʏᴛʜɪɴɢ."]
      @robe_hints = ["Iғ ʏᴏᴜ ᴇɴᴛᴇʀ sᴏᴍᴇᴛʜɪɴɢ ɪɴᴠᴀʟɪᴅ, ʏᴏᴜ'ʟʟ ᴘᴜᴛ ᴏɴ ᴛʜᴇ ʟᴀsᴛ ʀᴏʙᴇ ʏᴏᴜ ғᴏᴜɴᴅ.",
                "Eɴᴛᴇʀ ᴀ ɴᴜᴍʙᴇʀ, ɴᴏᴛ ᴛʜᴇ ɴᴀᴍᴇ ᴏғ ᴛʜᴇ ʀᴏʙᴇ.",
                "Fᴀɴᴄʏ ᴀ ɴɪᴄᴇ ʀᴏʙᴇ? Wᴇᴀʀ ᴏɴᴇ! Bᴜᴛ ᴅᴏɴ'ᴛ ᴇxᴘᴇᴄᴛ ᴀɴʏ ᴍᴀɢɪᴄ ᴇɴʜᴀᴄɪɴɢ ᴇғғᴇᴄᴛs ᴏʀ ᴀɴʏᴛʜɪɴɢ."]
    end

    def inventory_menu_options
      puts title_art.light_black.blink
      puts ""
      puts " Wʜᴀᴛ ᴡᴏᴜʟᴅ ʏᴏᴜ ʟɪᴋᴇ ᴛᴏ ᴄʜᴀɴɢᴇ #{'?'.light_black}"
      puts ""
      sleep(0.05)
      puts " 𝟙 #{'-'.light_black} ℍ𝕒𝕥"
      puts ""
      sleep(0.05)
      puts " 𝟚 #{'-'.light_black} ℝ𝕠𝕓𝕖"
      puts ""
      sleep(0.05)
      puts " 𝟛 #{'-'.light_black} ℕ𝕒𝕄𝕖"
      puts ""
      sleep(0.05)
      puts " 𝟡 #{'-'.light_black} #{'𝔹𝕒𝕔𝕜'.light_red}"
      puts ""
      sleep(0.05)
    end

    def current_clothing(hat, robe)
      puts " Cᴜʀʀᴇɴᴛ ᴄʟᴏᴛʜɪɴɢ:".light_black
      sleep(0.05)
      puts " Hᴀᴛ: #{hat.magenta}"
      sleep(0.05)
      puts " Rᴏʙᴇ: #{robe.magenta}"
      sleep(0.05)
      puts ""
      puts ""
    end

    #-----------------------------------Hats-----------------------------------#
    # List all owned hats
    def list_hats(hats)
        print "Tɪᴘ: ".magenta
        puts @hat_hints.sample.light_black
        print @witch_hat_art.magenta
        puts @hats_art.light_black.blink
        puts ""
        hats.each_with_index do |hat, index|
            puts "#{index + 1}#{' - '.magenta}#{hat}"
        end
        puts ""
    end

    # View current hat
    def view_current_hat(current_hat)
        puts "#{'Cᴜʀʀᴇɴᴛʟʏ ᴡᴇᴀʀɪɴɢ:'.light_black} #{current_hat.magenta}"
        puts ""
    end

    def ask_for_new_hat
        puts "Wʜɪᴄʜ ʜᴀᴛ ᴡᴏᴜʟᴅ ʏᴏᴜ ʟɪᴋᴇ ᴛᴏ ᴡᴇᴀʀ#{'?'.light_black}"
        puts ""
    end

    def putting_on_hat
        puts ""
        puts "Pᴜᴛᴛɪɴɢ ᴏɴ ʜᴀᴛ...".light_black
        sleep(1.25)
    end

    #-----------------------------------Robes-----------------------------------#

    # List all owned robes
    def list_robes(robes)
        print "Tɪᴘ: ".magenta
        puts @robe_hints.sample.light_black
        print @robes_art.light_black.blink
        print @witch_robe_art.magenta
        puts ""
        puts ""
        robes.each_with_index do |robe, index|
            puts "#{index + 1}#{' - '.magenta}#{robe}"
        end
        puts ""
    end

    # View current robe
    def view_current_robe(current_robe)
        puts "#{'Cᴜʀʀᴇɴᴛʟʏ ᴡᴇᴀʀɪɴɢ:'.light_black} #{current_robe.magenta}"
        puts ""
    end

    def ask_for_new_robe
        puts "Wʜɪᴄʜ Rᴏʙᴇ ᴡᴏᴜʟᴅ ʏᴏᴜ ʟɪᴋᴇ ᴛᴏ ᴡᴇᴀʀ#{'?'.light_black}"
        puts ""
    end

    def putting_on_robe
        puts ""
        puts "Pᴜᴛᴛɪɴɢ ᴏɴ Rᴏʙᴇ...".light_black
        sleep(1.25)
    end

    #-----------------------------------Name-----------------------------------#
    # Allows player to change their name
    def change_name(current_name)
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.light_yellow}Oh sorry, I thought you said your name was #{current_name}"
        sleep(0.8)
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.light_yellow}What's your name?"
        gets.chomp.capitalize
    end

    def changing_player_name(new_name)
        puts "#{'Gʀᴜɴᴛɪʟᴅᴀ> '.light_yellow}Got it, changing name to #{new_name}..."
        sleep(2)
    end

    #-----------------------------------Others-----------------------------------#

    def invalid_option
        puts @title_art.light_black.blink
        puts ""
        puts "Please select a valid option".light_red
        sleep(0.8)
    end
end
