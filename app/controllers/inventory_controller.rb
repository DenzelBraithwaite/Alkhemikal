require_relative '../views/inventory_view'

class InventoryController < ParentController
  def initialize
    super(player)
    @view = InventoryView.new
  end

  def run
    @running = true
    while @running
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

  # Routes player depending on their choice
  def route_action(action)
    case action
    when 1
        change_hat
    when 2
        change_robe
    when 3
        change_name
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

  # Allows player to change their name
  def change_name
    new_name = @view.change_name(@player.name)
    @player.name = capitalize_sentence(new_name)
    @view.changing_player_name(@player.name)
  end
end
