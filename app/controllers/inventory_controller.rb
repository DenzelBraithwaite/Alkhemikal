require_relative '../views/inventory_view'

class InventoryController < ParentController
  def initialize
    super(player)
    @view = InventoryView.new
  end

  def run
    @running = true
    while @running
      cheat_code_names
      @view.inventory_menu_options
      @view.current_clothing(@player.current_hat, @player.current_robe, @player.gold)
      print "#{@player.name}#{'> '.light_black}"
      action = gets.chomp.to_i
      clear
      @view.title_art.light_black.blink
      route_action(action)
      clear
    end
  end

  # Cheat codes, special things happen depending on your name
  def cheat_code_names
    @player.name = 'Enter a name dummy' if @player.name.empty?
    @player.name = 'Glinda' if @player.name == 'Gruntilda'
    @player.name = 'Tinkisa' if @player.name == 'Elisa'
    @player.name = 'Elisa' if @player.name == 'Tinky'
    @player.name = 'Zelda' if @player.name == 'Link'
    @player.name = 'Just Jazz' if @player.name == 'Justin'
    @player.name = 'B A Select Start' if @player.name == 'Up Up Down Down Left Right Left Right'
    @player.current_hat = 'Poetic mind' if @player.name == 'Just Jazz'
    @player.current_hat = 'Straw hat' if @player.name == 'Gol D'
    @player.current_hat = 'Bunny ears' if @player.name == 'Easter Egg'
    @player.current_hat = 'Powerful witch hat' if @player.name == 'Witch'
    @player.current_hat = 'Omnipotent crown' if @player.name == 'Kaz'
    @player.current_hat = 'Robe' if @player.name == 'Zak'
    @player.current_robe = 'Hat' if @player.name == 'Zak'
    @player.current_robe = 'Cloak of the creator' if @player.name == 'Kaz'
    @player.current_robe = "Kaz's warm embrace" if @player.name == 'Mat'
    @player.current_robe = 'Powerful witch robe' if @player.name == 'Witch'
    @player.current_robe = 'I ♡ NY shirt' if @player.name == 'Tourist'
    @player.current_robe = 'Coding hoodie' if @player.name == 'Alkhemikal'
    @player.gold = 0 if @player.name == 'Broke'
    @player.gold += 100 if @player.name == 'Gold'
    @player.gold = -666 if @player.name == 'Devil'
    @player.gold = 777 if @player.name == 'God'
    @player.gold = 99_999 if @player.name == 'Game Tester'
    @player.gold = 1337 if @player.name == 'Nerd'
    @player.gold = 99 if @player.name == 'B A Select Start'
  end

  # Routes player depending on their choice
  def route_action(action)
    case action
    when 1 then change_hat
    when 2 then change_robe
    when 3 then change_name
    when 4 then check_advice
    when 9 then @running = false
    else
      @view.invalid_option
      clear
    end
  end

  # Allows player to view all hats, select a hat, wear the hat.
  def change_hat
    @view.list_hats(@player.hats)
    @view.view_current_hat(@player.current_hat)
    @view.ask_for_new_hat
    print "#{@player.name}#{'> '.light_black}"
    index = gets.chomp.to_i
    index = @player.hats.length if index > @player.hats.length
    @player.current_hat = @player.hats[index - 1]
    @view.putting_on_hat
  end

  # Allows player to view all robes, select a robe, wear the robe.
  def change_robe
    @view.list_robes(@player.robes)
    @view.view_current_robe(@player.current_robe)
    @view.ask_for_new_robe
    print "#{@player.name}#{'> '.light_black}"
    index = gets.chomp.to_i
    index = @player.robes.length if index > @player.robes.length
    @player.current_robe = @player.robes[index - 1]
    @view.putting_on_robe
  end

  # Allows player to check pieces of advice purchased in shop.
  def check_advice
    @view.list_shopkeeper_advice(@player)
    continue_prompt
  end

  # Allows player to change their name
  def change_name
    @view.name_menu
    new_name = @view.change_name(@player.name)
    @player.name = capitalize_sentence(new_name)
    @view.changing_player_name(@player.name)
  end
end
