class OptionsController < BasicController
    # Method to change name
    def change_name(current_name, new_name)
        puts "Oh sorry, I thought you said your name was #{current_name}"
        sleep(1)
        puts "What's your name?"
        @name = new_name
    end
end