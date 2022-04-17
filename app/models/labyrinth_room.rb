# All actions for each labyrinth room, determines of the player can move or not.
class LabyrinthRoom
  attr_accessor :visited
  attr_reader :row_id, :column_id, :up, :down, :left, :right, :name, :role

  def initialize(attributes = {})
    @role = attributes[:role]
    @row_id = attributes[:row_id]
    @column_id = attributes[:column_id]
    @visited = false
    load_role
  end

  # Checks role, sets up,down,left,right depending on result. Use case statement
  def load_role
    case @role
    when :top_left_corner
      @up = false
      @down = true
      @left = false
      @right = true
    when :top_right_corner
      @up = false
      @down = true
      @left = true
      @right = false
    when :bottom_left_corner
      @up = true
      @down = false
      @left = false
      @right = true
    when :bottom_right_corner
      @up = true
      @down = false
      @left = true
      @right = false
    when :only_up
      @up = true
      @down = false
      @left = false
      @right = false
    when :only_down
      @up = false
      @down = true
      @left = false
      @right = false
    when :only_left
      @up = false
      @down = false
      @left = true
      @right = false
    when :only_right
      @up = false
      @down = false
      @left = false
      @right = true
    when :no_up
      @up = false
      @down = true
      @left = true
      @right = true
    when :no_down
      @up = true
      @down = false
      @left = true
      @right = true
    when :no_left
      @up = true
      @down = true
      @left = false
      @right = true
    when :no_right
      @up = true
      @down = true
      @left = true
      @right = false
    when :only_vertical
      @up = true
      @down = true
      @left = false
      @right = false
    when :only_horizontal
      @up = false
      @down = false
      @left = true
      @right = true
    when :any_direction
      @up = true
      @down = true
      @left = true
      @right = true
    end
  end
end
