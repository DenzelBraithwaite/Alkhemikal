require 'colorize'

class PotionMakingView
	attr_reader :intro_message, :potions_tutorial, :potions_tutorial_2

	@title_art = "
	██████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗	███╗░░░███╗░█████╗░██╗░░██╗██╗███╗░░██╗░██████╗░██╗
	██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║	████╗░████║██╔══██╗██║░██╔╝██║████╗░██║██╔════╝░██║
	██████╔╝██║░░██║░░░██║░░░██║██║░░██║██╔██╗██║	██╔████╔██║███████║█████═╝░██║██╔██╗██║██║░░██╗░██║
	██╔═══╝░██║░░██║░░░██║░░░██║██║░░██║██║╚████║	██║╚██╔╝██║██╔══██║██╔═██╗░██║██║╚████║██║░░╚██╗╚═╝
	██║░░░░░╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║	██║░╚═╝░██║██║░░██║██║░╚██╗██║██║░╚███║╚██████╔╝██╗
	╚═╝░░░░░░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝	╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝"

	@intro_message = "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} You are about to learn the subtle science and exact art of potion-making.
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} As there is little foolish wand-waving here, many of you will hardly believe this is magic.
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} I don't expect you will really understand the beauty of the softly simmering cauldron with its shimmering fumes,
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} the delicate power of liquids that creep through the human veins, bewitching the minds, ensnaring the senses...
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} I can teach you how to bottle liquid light, brew glory, and even capture the essence of flames.
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Let's hope you aren't as big a dunderhead as the last one.
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} He created a - now forbidden... potion that is irreversible. It's called the \"Vile vial of Amortentia\"
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Never, EVER, create the vial of Amortentia... Ever!"

	@potions_tutorial = "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} It's time to learn and in time; master, the subtle science of potion-making.
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} This will not be easy and you will fail many times, but a true witch knows failure preceeds greatness. 
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} I don't expect you will really understand the beauty of the softly simmering cauldron with its shimmering fumes,
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Get lost in a world of forgotten arts, once passed down through a bloodline of incredible magical beings!
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} I will do my best to teach you the basics, but after that, you're on your own.
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Are you ready to create your first potion? I hope you brought all the necessary ingredients...
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} You can leave this place at any time if you start to run low, there's a forest out back with plenty of fresh resources.
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Let me know when you're ready to begin, and once you start... there's no going back."

	@potions_tutorial_2 = "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Alright, to be honest potion making is actually incredibly intuitive,
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} you simply need to mix 2 ingredients together in a cauldron and see what happens.
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Certain potions are a little special, and may require more ingredients or special ingredients,
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} but please don't get consumed by the process, it's an art but by no means is it an obsession!
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Let me see what ingredients you've brought...Akkk! You barely have anything!
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} I guess we'll have to make the brew of beginnings, a wise first choice for any novice potion maker.
	\n#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Here's the recipe."

	def menu_options
        puts @title_art.light_magenta.blink
        puts ""
        puts "#{"Gʀᴜɴᴛɪʟᴅᴀ>".yellow} Wʜᴀᴛ ᴅᴏ ʏᴏᴜ ғᴇᴇʟ ʟɪᴋᴇ ᴅᴏɪɴɢ?"
        puts ""
        puts " 1 - create".light_yellow
        puts ""
        puts " 2 - Ingredients".light_yellow
        puts ""
        puts " 3 - recipes".light_yellow
        puts ""
        puts " 9 - ℚ𝕦𝕚𝕥".light_red
        puts ""
        puts ""
    end
end







