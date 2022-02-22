class MazeRoom
    def initialize(attributes = {})
        @row_id = attributes[row_id]
        @column_id = attributes[column_id]
        @up = attributes[up]
        @down = attributes[down]
        @left = attributes[left]
        @right = attributes[right]
    end

    def move_up
        # Check to see if there's a room in that direction

        # Display changing room dialogue

        # Change room to new room
    end

    def no_up
        if self.@row_id == 1
    end
end