class MazeRoom
    attr_reader :row_id, :column_id

    def initialize(attributes = {})
        @name
        @row_id = attributes[row_id]
        @column_id = attributes[column_id]
        @up = attributes[up]
        @down = attributes[down]
        @left = attributes[left]
        @right = attributes[right]
    end

    # def move_up?
    #     @up
    # end

    # def move_up
    #     @column_id += 1 
    # end
end