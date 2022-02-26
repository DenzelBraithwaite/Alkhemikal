require_relative '../models/maze'
# Make roles, corner / vertical / horizontal / up-only, right-only
class MazeRepo
    def initialize
        @rooms = [
            @room_r1_c1 = MazeRoom.new(:row_id 1, :column_id 1, role: :top_left_corner ),
            @room_r1_c2 = MazeRoom.new(:row_id 1, :column_id 2, role: :only_horizontal ),
            @room_r1_c3 = MazeRoom.new(:row_id 1, :column_id 3, role: :only_horizontal ),
            @room_r1_c4 = MazeRoom.new(:row_id 1, :column_id 4, role: :no_up ),
            @room_r1_c5 = MazeRoom.new(:row_id 1, :column_id 5, role: :only_horizontal ),
            @room_r1_c6 = MazeRoom.new(:row_id 1, :column_id 6, role: :only_left ),
            @room_r1_c7 = MazeRoom.new(:row_id 1, :column_id 7, role: :top_left_corner ),
            @room_r1_c8 = MazeRoom.new(:row_id 1, :column_id 8, role: :no_up ),
            @room_r1_c9 = MazeRoom.new(:row_id 1, :column_id 9, role: :top_right_corner ),
            @room_r1_c10 = MazeRoom.new(:row_id 1, :column_id 10, role: :bottom_left_corner ),
            @room_r1_c11 = MazeRoom.new(:row_id 1, :column_id 11, role: :top_right_corner ),
            @room_r1_c12 = MazeRoom.new(:row_id 1, :column_id 12, role: :top_left_corner ),
            @room_r1_c13 = MazeRoom.new(:row_id 1, :column_id 13, role: :top_right_corner ),
            @room_r1_c14 = MazeRoom.new(:row_id 1, :column_id 14, role: :only_right ),
            @room_r1_c15 = MazeRoom.new(:row_id 1, :column_id 15, role: :top_right_corner ),
            @room_r1_c16 = MazeRoom.new(:row_id 1, :column_id 16, role: :top_left_corner ),
            @room_r1_c17 = MazeRoom.new(:row_id 1, :column_id 17, role: :only_horizontal ),
            @room_r1_c18 = MazeRoom.new(:row_id 1, :column_id 18, role: :only_left ),
            @room_r1_c19 = MazeRoom.new(:row_id 1, :column_id 19, role: :top_left_corner ),
            @room_r1_c20 = MazeRoom.new(:row_id 1, :column_id 20, role: :top_right_corner ),

            @room_r2_c1 = MazeRoom.new(:row_id 2, :column_id 1, role: :only_vertical ),
            @room_r2_c2 = MazeRoom.new(:row_id 2, :column_id 2, role: :top_left_corner ),
            @room_r2_c3 = MazeRoom.new(:row_id 2, :column_id 3, role: :top_right_corner ),
            @room_r2_c4 = MazeRoom.new(:row_id 2, :column_id 4, role: :only_vertical ),
            @room_r2_c5 = MazeRoom.new(:row_id 2, :column_id 5, role: :only_right ),
            @room_r2_c6 = MazeRoom.new(:row_id 2, :column_id 6, role: :no_up ),
            @room_r2_c7 = MazeRoom.new(:row_id 2, :column_id 7, role: :bottom_right_corner ),
            @room_r2_c8 = MazeRoom.new(:row_id 2, :column_id 8, role: :only_vertical ),
            @room_r2_c9 = MazeRoom.new(:row_id 2, :column_id 9, role: :only_up ),
            @room_r2_c10 = MazeRoom.new(:row_id 2, :column_id 10, role: :top_left_corner ),
            @room_r2_c11 = MazeRoom.new(:row_id 2, :column_id 11, role: :no_down ),
            @room_r2_c12 = MazeRoom.new(:row_id 2, :column_id 12, role: :no_right ),
            @room_r2_c13 = MazeRoom.new(:row_id 2, :column_id 13, role: :bottom_left_corner ),
            @room_r2_c14 = MazeRoom.new(:row_id 2, :column_id 14, role: :only_horizontal ),
            @room_r2_c15 = MazeRoom.new(:row_id 2, :column_id 15, role: :no_down ),
            @room_r2_c16 = MazeRoom.new(:row_id 2, :column_id 16, role: :bottom_right_corner ),
            @room_r2_c17 = MazeRoom.new(:row_id 2, :column_id 17, role: :only_right ),
            @room_r2_c18 = MazeRoom.new(:row_id 2, :column_id 18, role: :no_up ),
            @room_r2_c19 = MazeRoom.new(:row_id 2, :column_id 19, role: :bottom_right_corner ),
            @room_r2_c20 = MazeRoom.new(:row_id 2, :column_id 20, role: :only_vertical ),

            @room_r3_c1 = MazeRoom.new(:row_id 3, :column_id 1, role: :only_up ),
            @room_r3_c2 = MazeRoom.new(:row_id 3, :column_id 2, role: :only_vertical ),
            @room_r3_c3 = MazeRoom.new(:row_id 3, :column_id 3, role: :bottom_left_corner ),
            @room_r3_c4 = MazeRoom.new(:row_id 3, :column_id 4, role: :no_down ),
            @room_r3_c5 = MazeRoom.new(:row_id 3, :column_id 5, role: :top_right_corner ),
            @room_r3_c6 = MazeRoom.new(:row_id 3, :column_id 6, role: :only_vertical ),
            @room_r3_c7 = MazeRoom.new(:row_id 3, :column_id 7, role: :top_left_corner ),
            @room_r3_c8 = MazeRoom.new(:row_id 3, :column_id 8, role: :no_down ),
            @room_r3_c9 = MazeRoom.new(:row_id 3, :column_id 9, role: :only_horizontal ),
            @room_r3_c10 = MazeRoom.new(:row_id 3, :column_id 10, role: :bottom_right_corner ),
            @room_r3_c11 = MazeRoom.new(:row_id 3, :column_id 11, role: :only_down ),
            @room_r3_c12 = MazeRoom.new(:row_id 3, :column_id 12, role: :bottom_left_corner ),
            @room_r3_c13 = MazeRoom.new(:row_id 3, :column_id 13, role: :no_up ),
            @room_r3_c14 = MazeRoom.new(:row_id 3, :column_id 14, role: :top_right_corner ),
            @room_r3_c15 = MazeRoom.new(:row_id 3, :column_id 15, role: :top_left_corner ),
            @room_r3_c16 = MazeRoom.new(:row_id 3, :column_id 16, role: :only_horizontal ),
            @room_r3_c17 = MazeRoom.new(:row_id 3, :column_id 17, role: :top_right_corner ),
            @room_r3_c18 = MazeRoom.new(:row_id 3, :column_id 18, role: :bottom_left_corner ),
            @room_r3_c19 = MazeRoom.new(:row_id 3, :column_id 19, role: :top_right_corner ),
            @room_r3_c20 = MazeRoom.new(:row_id 3, :column_id 20, role: :only_vertical ),

            @room_r4_c1 = MazeRoom.new(:row_id 4, :column_id 1, role: :top_left_corner ),
            @room_r4_c2 = MazeRoom.new(:row_id 4, :column_id 2, role: :no_down ),
            @room_r4_c3 = MazeRoom.new(:row_id 4, :column_id 3, role: :only_left ),
            @room_r4_c4 = MazeRoom.new(:row_id 4, :column_id 4, role: :top_left_corner ),
            @room_r4_c5 = MazeRoom.new(:row_id 4, :column_id 5, role: :bottom_right_corner ),
            @room_r4_c6 = MazeRoom.new(:row_id 4, :column_id 6, role: :only_up ),
            @room_r4_c7 = MazeRoom.new(:row_id 4, :column_id 7, role: :only_vertical ),
            @room_r4_c8 = MazeRoom.new(:row_id 4, :column_id 8, role: :top_left_corner ),
            @room_r4_c9 = MazeRoom.new(:row_id 4, :column_id 9, role: :only_horizontal ),
            @room_r4_c10 = MazeRoom.new(:row_id 4, :column_id 10, role: :top_right_corner ),
            @room_r4_c11 = MazeRoom.new(:row_id 4, :column_id 11, role: :no_left ),
            @room_r4_c12 = MazeRoom.new(:row_id 4, :column_id 12, role: :top_right_corner ),
            @room_r4_c13 = MazeRoom.new(:row_id 4, :column_id 13, role: :only_vertical ),
            @room_r4_c14 = MazeRoom.new(:row_id 4, :column_id 14, role: :only_vertical ),
            @room_r4_c15 = MazeRoom.new(:row_id 4, :column_id 15, role: :bottom_left_corner ),
            @room_r4_c16 = MazeRoom.new(:row_id 4, :column_id 16, role: :top_right_corner ),
            @room_r4_c17 = MazeRoom.new(:row_id 4, :column_id 17, role: :bottom_left_corner ),
            @room_r4_c18 = MazeRoom.new(:row_id 4, :column_id 18, role: :top_right_corner ),
            @room_r4_c19 = MazeRoom.new(:row_id 4, :column_id 19, role: :only_vertical ),
            @room_r4_c20 = MazeRoom.new(:row_id 4, :column_id 20, role: :only_vertical ),

            @room_r5_c1 = MazeRoom.new(:row_id 5, :column_id 1, role: :bottom_left_corner ),
            @room_r5_c2 = MazeRoom.new(:row_id 5, :column_id 2, role: :only_horizontal ),
            @room_r5_c3 = MazeRoom.new(:row_id 5, :column_id 3, role: :top_right_corner ),
            @room_r5_c4 = MazeRoom.new(:row_id 5, :column_id 4, role: :bottom_left_corner ),
            @room_r5_c5 = MazeRoom.new(:row_id 5, :column_id 5, role: :no_up ),
            @room_r5_c6 = MazeRoom.new(:row_id 5, :column_id 6, role: :only_horizontal ),
            @room_r5_c7 = MazeRoom.new(:row_id 5, :column_id 7, role: :bottom_right_corner ),
            @room_r5_c8 = MazeRoom.new(:row_id 5, :column_id 8, role: :only_horizontal ),
            @room_r5_c9 = MazeRoom.new(:row_id 5, :column_id 9, role: :top_left_corner ),
            @room_r5_c10 = MazeRoom.new(:row_id 5, :column_id 10, role: :no_down ),
            @room_r5_c11 = MazeRoom.new(:row_id 5, :column_id 11, role: :bottom_right_corner ),
            @room_r5_c12 = MazeRoom.new(:row_id 5, :column_id 12, role: :bottom_left_corner ),
            @room_r5_c13 = MazeRoom.new(:row_id 5, :column_id 13, role: :bottom_right_corner ),
            @room_r5_c14 = MazeRoom.new(:row_id 5, :column_id 14, role: :bottom_left_corner ),
            @room_r5_c15 = MazeRoom.new(:row_id 5, :column_id 15, role: :top_right_corner ),
            @room_r5_c16 = MazeRoom.new(:row_id 5, :column_id 16, role: :only_vertical ),
            @room_r5_c17 = MazeRoom.new(:row_id 5, :column_id 17, role: :top_left_corner ),
            @room_r5_c18 = MazeRoom.new(:row_id 5, :column_id 18, role: :bottom_right_corner ),
            @room_r5_c19 = MazeRoom.new(:row_id 5, :column_id 19, role: :only_vertical ),
            @room_r5_c20 = MazeRoom.new(:row_id 5, :column_id 20, role: :only_up ),

            @room_r6_c1 = MazeRoom.new(:row_id 6, :column_id 1, role: :top_left_corner ),
            @room_r6_c2 = MazeRoom.new(:row_id 6, :column_id 2, role: :only_left ),
            @room_r6_c3 = MazeRoom.new(:row_id 6, :column_id 3, role: :bottom_left_corner ),
            @room_r6_c4 = MazeRoom.new(:row_id 6, :column_id 4, role: :top_right_corner ),
            @room_r6_c5 = MazeRoom.new(:row_id 6, :column_id 5, role: :only_vertical ),
            @room_r6_c6 = MazeRoom.new(:row_id 6, :column_id 6, role: :top_left_corner ),
            @room_r6_c7 = MazeRoom.new(:row_id 6, :column_id 7, role: :only_horizontal ),
            @room_r6_c8 = MazeRoom.new(:row_id 6, :column_id 8, role: :bottom_left_corner ),
            @room_r6_c9 = MazeRoom.new(:row_id 6, :column_id 9, role: :bottom_right_corner ),
            @room_r6_c10 = MazeRoom.new(:row_id 6, :column_id 10, role: :only_horizontal ),
            @room_r6_c11 = MazeRoom.new(:row_id 6, :column_id 11, role: :only_left ),
            @room_r6_c12 = MazeRoom.new(:row_id 6, :column_id 12, role: :top_left_corner ),
            @room_r6_c13 = MazeRoom.new(:row_id 6, :column_id 13, role: :horizontal ),
            @room_r6_c14 = MazeRoom.new(:row_id 6, :column_id 14, role: :top_right_corner ),
            @room_r6_c15 = MazeRoom.new(:row_id 6, :column_id 15, role: :only_vertical ),
            @room_r6_c16 = MazeRoom.new(:row_id 6, :column_id 16, role: :only_vertical ),
            @room_r6_c17 = MazeRoom.new(:row_id 6, :column_id 17, role: :bottom_left_corner ),
            @room_r6_c18 = MazeRoom.new(:row_id 6, :column_id 18, role: :top_right_corner ),
            @room_r6_c19 = MazeRoom.new(:row_id 6, :column_id 19, role: :bottom_left_corner ),
            @room_r6_c20 = MazeRoom.new(:row_id 6, :column_id 20, role: :top_right_corner ),

            @room_r7_c1 = MazeRoom.new(:row_id 7, :column_id 1, role: :no_left ),
            @room_r7_c2 = MazeRoom.new(:row_id 7, :column_id 2, role: :only_horizontal ),
            @room_r7_c3 = MazeRoom.new(:row_id 7, :column_id 3, role: :top_right_corner ),
            @room_r7_c4 = MazeRoom.new(:row_id 7, :column_id 4, role: :only_vertical ),
            @room_r7_c5 = MazeRoom.new(:row_id 7, :column_id 5, role: :only_vertical ),
            @room_r7_c6 = MazeRoom.new(:row_id 7, :column_id 6, role: :bottom_left_corner ),
            @room_r7_c7 = MazeRoom.new(:row_id 7, :column_id 7, role: :only_left ),
            @room_r7_c8 = MazeRoom.new(:row_id 7, :column_id 8, role: :top_left_corner ),
            @room_r7_c9 = MazeRoom.new(:row_id 7, :column_id 9, role: :top_right_corner ),
            @room_r7_c10 = MazeRoom.new(:row_id 7, :column_id 10, role: :top_left_corner ),
            @room_r7_c11 = MazeRoom.new(:row_id 7, :column_id 11, role: :top_right_corner ),
            @room_r7_c12 = MazeRoom.new(:row_id 7, :column_id 12, role: :bottom_left_corner ),
            @room_r7_c13 = MazeRoom.new(:row_id 7, :column_id 13, role: :top_right_corner ),
            @room_r7_c14 = MazeRoom.new(:row_id 7, :column_id 14, role: :bottom_left_corner ),
            @room_r7_c15 = MazeRoom.new(:row_id 7, :column_id 15, role: :no_right ),
            @room_r7_c16 = MazeRoom.new(:row_id 7, :column_id 16, role: :only_up ),
            @room_r7_c17 = MazeRoom.new(:row_id 7, :column_id 17, role: :top_left_corner ),
            @room_r7_c18 = MazeRoom.new(:row_id 7, :column_id 18, role: :bottom_right_corner ),
            @room_r7_c19 = MazeRoom.new(:row_id 7, :column_id 19, role: :top_left_corner ),
            @room_r7_c20 = MazeRoom.new(:row_id 7, :column_id 20, role: :no_right ),

            @room_r8_c1 = MazeRoom.new(:row_id 8, :column_id 1, role: :only_vertical ),
            @room_r8_c2 = MazeRoom.new(:row_id 8, :column_id 2, role: :only_down ),
            @room_r8_c3 = MazeRoom.new(:row_id 8, :column_id 3, role: :bottom_left_corner ),
            @room_r8_c4 = MazeRoom.new(:row_id 8, :column_id 4, role: :bottom_right_corner ),
            @room_r8_c5 = MazeRoom.new(:row_id 8, :column_id 5, role: :bottom_left_corner ),
            @room_r8_c6 = MazeRoom.new(:row_id 8, :column_id 6, role: :only_horizontal ),
            @room_r8_c7 = MazeRoom.new(:row_id 8, :column_id 7, role: :top_right_corner ),
            @room_r8_c8 = MazeRoom.new(:row_id 8, :column_id 8, role: :only_up ),
            @room_r8_c9 = MazeRoom.new(:row_id 8, :column_id 9, role: :bottom_left_corner ),
            @room_r8_c10 = MazeRoom.new(:row_id 8, :column_id 10, role: : ),
            @room_r8_c11 = MazeRoom.new(:row_id 8, :column_id 11, role: : ),
            @room_r8_c12 = MazeRoom.new(:row_id 8, :column_id 12, role: : ),
            @room_r8_c13 = MazeRoom.new(:row_id 8, :column_id 13, role: : ),
            @room_r8_c14 = MazeRoom.new(:row_id 8, :column_id 14, role: : ),
            @room_r8_c15 = MazeRoom.new(:row_id 8, :column_id 15, role: : ),
            @room_r8_c16 = MazeRoom.new(:row_id 8, :column_id 16, role: : ),
            @room_r8_c17 = MazeRoom.new(:row_id 8, :column_id 17, role: : ),
            @room_r8_c18 = MazeRoom.new(:row_id 8, :column_id 18, role: : ),
            @room_r8_c19 = MazeRoom.new(:row_id 8, :column_id 19, role: : ),
            @room_r8_c20 = MazeRoom.new(:row_id 8, :column_id 20, role: : ),

            @room_r9_c1 = MazeRoom.new(:row_id 9, :column_id 1, role: : ),
            @room_r9_c2 = MazeRoom.new(:row_id 9, :column_id 2, role: : ),
            @room_r9_c3 = MazeRoom.new(:row_id 9, :column_id 3, role: : ),
            @room_r9_c4 = MazeRoom.new(:row_id 9, :column_id 4, role: : ),
            @room_r9_c5 = MazeRoom.new(:row_id 9, :column_id 5, role: : ),
            @room_r9_c6 = MazeRoom.new(:row_id 9, :column_id 6, role: : ),
            @room_r9_c7 = MazeRoom.new(:row_id 9, :column_id 7, role: : ),
            @room_r9_c8 = MazeRoom.new(:row_id 9, :column_id 8, role: : ),
            @room_r9_c9 = MazeRoom.new(:row_id 9, :column_id 9, role: : ),
            @room_r9_c10 = MazeRoom.new(:row_id 9, :column_id 10, role: : ),
            @room_r9_c11 = MazeRoom.new(:row_id 9, :column_id 11, role: : ),
            @room_r9_c12 = MazeRoom.new(:row_id 9, :column_id 12, role: : ),
            @room_r9_c13 = MazeRoom.new(:row_id 9, :column_id 13, role: : ),
            @room_r9_c14 = MazeRoom.new(:row_id 9, :column_id 14, role: : ),
            @room_r9_c15 = MazeRoom.new(:row_id 9, :column_id 15, role: : ),
            @room_r9_c16 = MazeRoom.new(:row_id 9, :column_id 16, role: : ),
            @room_r9_c17 = MazeRoom.new(:row_id 9, :column_id 17, role: : ),
            @room_r9_c18 = MazeRoom.new(:row_id 9, :column_id 18, role: : ),
            @room_r9_c19 = MazeRoom.new(:row_id 9, :column_id 19, role: : ),
            @room_r9_c20 = MazeRoom.new(:row_id 9, :column_id 20, role: : ),

            @room_r10_c1 = MazeRoom.new(:row_id 10, :column_id 1, role: : ),
            @room_r10_c2 = MazeRoom.new(:row_id 10, :column_id 2, role: : ),
            @room_r10_c3 = MazeRoom.new(:row_id 10, :column_id 3, role: : ),
            @room_r10_c4 = MazeRoom.new(:row_id 10, :column_id 4, role: : ),
            @room_r10_c5 = MazeRoom.new(:row_id 10, :column_id 5, role: : ),
            @room_r10_c6 = MazeRoom.new(:row_id 10, :column_id 6, role: : ),
            @room_r10_c7 = MazeRoom.new(:row_id 10, :column_id 7, role: : ),
            @room_r10_c8 = MazeRoom.new(:row_id 10, :column_id 8, role: : ),
            @room_r10_c9 = MazeRoom.new(:row_id 10, :column_id 9, role: : ),
            @room_r10_c10 = MazeRoom.new(:row_id 10, :column_id 10, role: : ),
            @room_r10_c11 = MazeRoom.new(:row_id 10, :column_id 11, role: : ),
            @room_r10_c12 = MazeRoom.new(:row_id 10, :column_id 12, role: : ),
            @room_r10_c13 = MazeRoom.new(:row_id 10, :column_id 13, role: : ),
            @room_r10_c14 = MazeRoom.new(:row_id 10, :column_id 14, role: : ),
            @room_r10_c15 = MazeRoom.new(:row_id 10, :column_id 15, role: : ),
            @room_r10_c16 = MazeRoom.new(:row_id 10, :column_id 16, role: : ),
            @room_r10_c17 = MazeRoom.new(:row_id 10, :column_id 17, role: : ),
            @room_r10_c18 = MazeRoom.new(:row_id 10, :column_id 18, role: : ),
            @room_r10_c19 = MazeRoom.new(:row_id 10, :column_id 19, role: : ),
            @room_r10_c20 = MazeRoom.new(:row_id 10, :column_id 20, role: : ),

            @room_r11_c1 = MazeRoom.new(:row_id 11, :column_id 1, role: : ),
            @room_r11_c2 = MazeRoom.new(:row_id 11, :column_id 2, role: : ),
            @room_r11_c3 = MazeRoom.new(:row_id 11, :column_id 3, role: : ),
            @room_r11_c4 = MazeRoom.new(:row_id 11, :column_id 4, role: : ),
            @room_r11_c5 = MazeRoom.new(:row_id 11, :column_id 5, role: : ),
            @room_r11_c6 = MazeRoom.new(:row_id 11, :column_id 6, role: : ),
            @room_r11_c7 = MazeRoom.new(:row_id 11, :column_id 7, role: : ),
            @room_r11_c8 = MazeRoom.new(:row_id 11, :column_id 8, role: : ),
            @room_r11_c9 = MazeRoom.new(:row_id 11, :column_id 9, role: : ),
            @room_r11_c10 = MazeRoom.new(:row_id 11, :column_id 10, role: : ),
            @room_r11_c11 = MazeRoom.new(:row_id 11, :column_id 11, role: : ),
            @room_r11_c12 = MazeRoom.new(:row_id 11, :column_id 12, role: : ),
            @room_r11_c13 = MazeRoom.new(:row_id 11, :column_id 13, role: : ),
            @room_r11_c14 = MazeRoom.new(:row_id 11, :column_id 14, role: : ),
            @room_r11_c15 = MazeRoom.new(:row_id 11, :column_id 15, role: : ),
            @room_r11_c16 = MazeRoom.new(:row_id 11, :column_id 16, role: : ),
            @room_r11_c17 = MazeRoom.new(:row_id 11, :column_id 17, role: : ),
            @room_r11_c18 = MazeRoom.new(:row_id 11, :column_id 18, role: : ),
            @room_r11_c19 = MazeRoom.new(:row_id 11, :column_id 29, role: : ),
            @room_r11_c20 = MazeRoom.new(:row_id 11, :column_id 20, role: : ),

            @room_r12_c1 = MazeRoom.new(:row_id 12, :column_id 1, role: : ),
            @room_r12_c2 = MazeRoom.new(:row_id 12, :column_id 2, role: : ),
            @room_r12_c3 = MazeRoom.new(:row_id 12, :column_id 3, role: : ),
            @room_r12_c4 = MazeRoom.new(:row_id 12, :column_id 4, role: : ),
            @room_r12_c5 = MazeRoom.new(:row_id 12, :column_id 5, role: : ),
            @room_r12_c6 = MazeRoom.new(:row_id 12, :column_id 6, role: : ),
            @room_r12_c7 = MazeRoom.new(:row_id 12, :column_id 7, role: : ),
            @room_r12_c8 = MazeRoom.new(:row_id 12, :column_id 8, role: : ),
            @room_r12_c9 = MazeRoom.new(:row_id 12, :column_id 9, role: : ),
            @room_r12_c10 = MazeRoom.new(:row_id 12, :column_id 10, role: : ),
            @room_r12_c11 = MazeRoom.new(:row_id 12, :column_id 11, role: : ),
            @room_r12_c12 = MazeRoom.new(:row_id 12, :column_id 12, role: : ),
            @room_r12_c13 = MazeRoom.new(:row_id 12, :column_id 13, role: : ),
            @room_r12_c14 = MazeRoom.new(:row_id 12, :column_id 14, role: : ),
            @room_r12_c15 = MazeRoom.new(:row_id 12, :column_id 15, role: : ),
            @room_r12_c16 = MazeRoom.new(:row_id 12, :column_id 16, role: : ),
            @room_r12_c17 = MazeRoom.new(:row_id 12, :column_id 17, role: : ),
            @room_r12_c18 = MazeRoom.new(:row_id 12, :column_id 18, role: : ),
            @room_r12_c19 = MazeRoom.new(:row_id 12, :column_id 19, role: : ),
            @room_r12_c20 = MazeRoom.new(:row_id 12, :column_id 20, role: : ),

            @room_r13_c1 = MazeRoom.new(:row_id 13, :column_id 1, role: : ),
            @room_r13_c2 = MazeRoom.new(:row_id 13, :column_id 2, role: : ),
            @room_r13_c3 = MazeRoom.new(:row_id 13, :column_id 3, role: : ),
            @room_r13_c4 = MazeRoom.new(:row_id 13, :column_id 4, role: : ),
            @room_r13_c5 = MazeRoom.new(:row_id 13, :column_id 5, role: : ),
            @room_r13_c6 = MazeRoom.new(:row_id 13, :column_id 6, role: : ),
            @room_r13_c7 = MazeRoom.new(:row_id 13, :column_id 7, role: : ),
            @room_r13_c8 = MazeRoom.new(:row_id 13, :column_id 8, role: : ),
            @room_r13_c9 = MazeRoom.new(:row_id 13, :column_id 9, role: : ),
            @room_r13_c10 = MazeRoom.new(:row_id 13, :column_id 10, role: : ),
            @room_r13_c11 = MazeRoom.new(:row_id 13, :column_id 11, role: : ),
            @room_r13_c12 = MazeRoom.new(:row_id 13, :column_id 12, role: : ),
            @room_r13_c13 = MazeRoom.new(:row_id 13, :column_id 13, role: : ),
            @room_r13_c14 = MazeRoom.new(:row_id 13, :column_id 14, role: : ),
            @room_r13_c15 = MazeRoom.new(:row_id 13, :column_id 15, role: : ),
            @room_r13_c16 = MazeRoom.new(:row_id 13, :column_id 16, role: : ),
            @room_r13_c17 = MazeRoom.new(:row_id 13, :column_id 17, role: : ),
            @room_r13_c18 = MazeRoom.new(:row_id 13, :column_id 18, role: : ),
            @room_r13_c19 = MazeRoom.new(:row_id 13, :column_id 19, role: : ),
            @room_r13_c20 = MazeRoom.new(:row_id 13, :column_id 20, role: : ),

            @room_r14_c1 = MazeRoom.new(:row_id 14, :column_id 1, role: : ),
            @room_r14_c2 = MazeRoom.new(:row_id 14, :column_id 2, role: : ),
            @room_r14_c3 = MazeRoom.new(:row_id 14, :column_id 3, role: : ),
            @room_r14_c4 = MazeRoom.new(:row_id 14, :column_id 4, role: : ),
            @room_r14_c5 = MazeRoom.new(:row_id 14, :column_id 5, role: : ),
            @room_r14_c6 = MazeRoom.new(:row_id 14, :column_id 6, role: : ),
            @room_r14_c7 = MazeRoom.new(:row_id 14, :column_id 7, role: : ),
            @room_r14_c8 = MazeRoom.new(:row_id 14, :column_id 8, role: : ),
            @room_r14_c9 = MazeRoom.new(:row_id 14, :column_id 9, role: : ),
            @room_r14_c10 = MazeRoom.new(:row_id 14, :column_id 10, role: : ),
            @room_r14_c11 = MazeRoom.new(:row_id 14, :column_id 11, role: : ),
            @room_r14_c12 = MazeRoom.new(:row_id 14, :column_id 12, role: : ),
            @room_r14_c13 = MazeRoom.new(:row_id 14, :column_id 13, role: : ),
            @room_r14_c14 = MazeRoom.new(:row_id 14, :column_id 14, role: : ),
            @room_r14_c15 = MazeRoom.new(:row_id 14, :column_id 15, role: : ),
            @room_r14_c16 = MazeRoom.new(:row_id 14, :column_id 16, role: : ),
            @room_r14_c17 = MazeRoom.new(:row_id 14, :column_id 17, role: : ),
            @room_r14_c18 = MazeRoom.new(:row_id 14, :column_id 18, role: : ),
            @room_r14_c19 = MazeRoom.new(:row_id 14, :column_id 19, role: : ),
            @room_r14_c20 = MazeRoom.new(:row_id 14, :column_id 20, role: : ),

            @room_r15_c1 = MazeRoom.new(:row_id 15, :column_id 1, role: : ),
            @room_r15_c2 = MazeRoom.new(:row_id 15, :column_id 2, role: : ),
            @room_r15_c3 = MazeRoom.new(:row_id 15, :column_id 3, role: : ),
            @room_r15_c4 = MazeRoom.new(:row_id 15, :column_id 4, role: : ),
            @room_r15_c5 = MazeRoom.new(:row_id 15, :column_id 5, role: : ),
            @room_r15_c6 = MazeRoom.new(:row_id 15, :column_id 6, role: : ),
            @room_r15_c7 = MazeRoom.new(:row_id 15, :column_id 7, role: : ),
            @room_r15_c8 = MazeRoom.new(:row_id 15, :column_id 8, role: : ),
            @room_r15_c9 = MazeRoom.new(:row_id 15, :column_id 9, role: : ),
            @room_r15_c10 = MazeRoom.new(:row_id 15, :column_id 10, role: : ),
            @room_r15_c11 = MazeRoom.new(:row_id 15, :column_id 11, role: : ),
            @room_r15_c12 = MazeRoom.new(:row_id 15, :column_id 12, role: : ),
            @room_r15_c13 = MazeRoom.new(:row_id 15, :column_id 13, role: : ),
            @room_r15_c14 = MazeRoom.new(:row_id 15, :column_id 14, role: : ),
            @room_r15_c15 = MazeRoom.new(:row_id 15, :column_id 15, role: : ),
            @room_r15_c16 = MazeRoom.new(:row_id 15, :column_id 16, role: : ),
            @room_r15_c17 = MazeRoom.new(:row_id 15, :column_id 17, role: : ),
            @room_r15_c18 = MazeRoom.new(:row_id 15, :column_id 18, role: : ),
            @room_r15_c19 = MazeRoom.new(:row_id 15, :column_id 19, role: : ),
            @room_r15_c20 = MazeRoom.new(:row_id 15, :column_id 20, role: : ),

            @room_r16_c1 = MazeRoom.new(:row_id 16, :column_id 1, role: : ),
            @room_r16_c2 = MazeRoom.new(:row_id 16, :column_id 2, role: : ),
            @room_r16_c3 = MazeRoom.new(:row_id 16, :column_id 3, role: : ),
            @room_r16_c4 = MazeRoom.new(:row_id 16, :column_id 4, role: : ),
            @room_r16_c5 = MazeRoom.new(:row_id 16, :column_id 5, role: : ),
            @room_r16_c6 = MazeRoom.new(:row_id 16, :column_id 6, role: : ),
            @room_r16_c7 = MazeRoom.new(:row_id 16, :column_id 7, role: : ),
            @room_r16_c8 = MazeRoom.new(:row_id 16, :column_id 8, role: : ),
            @room_r16_c9 = MazeRoom.new(:row_id 16, :column_id 9, role: : ),
            @room_r16_c10 = MazeRoom.new(:row_id 16, :column_id 10, role: : ),
            @room_r16_c11 = MazeRoom.new(:row_id 16, :column_id 11, role: : ),
            @room_r16_c12 = MazeRoom.new(:row_id 16, :column_id 12, role: : ),
            @room_r16_c13 = MazeRoom.new(:row_id 16, :column_id 13, role: : ),
            @room_r16_c14 = MazeRoom.new(:row_id 16, :column_id 14, role: : ),
            @room_r16_c15 = MazeRoom.new(:row_id 16, :column_id 15, role: : ),
            @room_r16_c16 = MazeRoom.new(:row_id 16, :column_id 16, role: : ),
            @room_r16_c17 = MazeRoom.new(:row_id 16, :column_id 17, role: : ),
            @room_r16_c18 = MazeRoom.new(:row_id 16, :column_id 18, role: : ),
            @room_r16_c19 = MazeRoom.new(:row_id 16, :column_id 19, role: : ),
            @room_r16_c20 = MazeRoom.new(:row_id 16, :column_id 20, role: : ),

            @room_r17_c1 = MazeRoom.new(:row_id 17, :column_id 1, role: : ),
            @room_r17_c2 = MazeRoom.new(:row_id 17, :column_id 2, role: : ),
            @room_r17_c3 = MazeRoom.new(:row_id 17, :column_id 3, role: : ),
            @room_r17_c4 = MazeRoom.new(:row_id 17, :column_id 4, role: : ),
            @room_r17_c5 = MazeRoom.new(:row_id 17, :column_id 5, role: : ),
            @room_r17_c6 = MazeRoom.new(:row_id 17, :column_id 6, role: : ),
            @room_r17_c7 = MazeRoom.new(:row_id 17, :column_id 7, role: : ),
            @room_r17_c8 = MazeRoom.new(:row_id 17, :column_id 8, role: : ),
            @room_r17_c9 = MazeRoom.new(:row_id 17, :column_id 9, role: : ),
            @room_r17_c10 = MazeRoom.new(:row_id 17, :column_id 10, role: : ),
            @room_r17_c11 = MazeRoom.new(:row_id 17, :column_id 11, role: : ),
            @room_r17_c12 = MazeRoom.new(:row_id 17, :column_id 12, role: : ),
            @room_r17_c13 = MazeRoom.new(:row_id 17, :column_id 13, role: : ),
            @room_r17_c14 = MazeRoom.new(:row_id 17, :column_id 14, role: : ),
            @room_r17_c15 = MazeRoom.new(:row_id 17, :column_id 15, role: : ),
            @room_r17_c16 = MazeRoom.new(:row_id 17, :column_id 16, role: : ),
            @room_r17_c17 = MazeRoom.new(:row_id 17, :column_id 17, role: : ),
            @room_r17_c18 = MazeRoom.new(:row_id 17, :column_id 18, role: : ),
            @room_r17_c19 = MazeRoom.new(:row_id 17, :column_id 19, role: : ),
            @room_r17_c20 = MazeRoom.new(:row_id 17, :column_id 20, role: : ),

            @room_r18_c1 = MazeRoom.new(:row_id 18, :column_id 1, role: : ),
            @room_r18_c2 = MazeRoom.new(:row_id 18, :column_id 2, role: : ),
            @room_r18_c3 = MazeRoom.new(:row_id 18, :column_id 3, role: : ),
            @room_r18_c4 = MazeRoom.new(:row_id 18, :column_id 4, role: : ),
            @room_r18_c5 = MazeRoom.new(:row_id 18, :column_id 5, role: : ),
            @room_r18_c6 = MazeRoom.new(:row_id 18, :column_id 6, role: : ),
            @room_r18_c7 = MazeRoom.new(:row_id 18, :column_id 7, role: : ),
            @room_r18_c8 = MazeRoom.new(:row_id 18, :column_id 8, role: : ),
            @room_r18_c9 = MazeRoom.new(:row_id 18, :column_id 9, role: : ),
            @room_r18_c10 = MazeRoom.new(:row_id 18, :column_id 10, role: : ),
            @room_r18_c11 = MazeRoom.new(:row_id 18, :column_id 11, role: : ),
            @room_r18_c12 = MazeRoom.new(:row_id 18, :column_id 12, role: : ),
            @room_r18_c13 = MazeRoom.new(:row_id 18, :column_id 13, role: : ),
            @room_r18_c14 = MazeRoom.new(:row_id 18, :column_id 14, role: : ),
            @room_r18_c15 = MazeRoom.new(:row_id 18, :column_id 15, role: : ),
            @room_r18_c16 = MazeRoom.new(:row_id 18, :column_id 16, role: : ),
            @room_r18_c17 = MazeRoom.new(:row_id 18, :column_id 17, role: : ),
            @room_r18_c18 = MazeRoom.new(:row_id 18, :column_id 18, role: : ),
            @room_r18_c19 = MazeRoom.new(:row_id 18, :column_id 19, role: : ),
            @room_r18_c20 = MazeRoom.new(:row_id 18, :column_id 20, role: : ),

            @room_r19_c1 = MazeRoom.new(:row_id 19, :column_id 1, role: : ),
            @room_r19_c2 = MazeRoom.new(:row_id 19, :column_id 2, role: : ),
            @room_r19_c3 = MazeRoom.new(:row_id 19, :column_id 3, role: : ),
            @room_r19_c4 = MazeRoom.new(:row_id 19, :column_id 4, role: : ),
            @room_r19_c5 = MazeRoom.new(:row_id 19, :column_id 5, role: : ),
            @room_r19_c6 = MazeRoom.new(:row_id 19, :column_id 6, role: : ),
            @room_r19_c7 = MazeRoom.new(:row_id 19, :column_id 7, role: : ),
            @room_r19_c8 = MazeRoom.new(:row_id 19, :column_id 8, role: : ),
            @room_r19_c9 = MazeRoom.new(:row_id 19, :column_id 9, role: : ),
            @room_r19_c10 = MazeRoom.new(:row_id 19, :column_id 10, role: : ),
            @room_r19_c11 = MazeRoom.new(:row_id 19, :column_id 11, role: : ),
            @room_r19_c12 = MazeRoom.new(:row_id 19, :column_id 12, role: : ),
            @room_r19_c13 = MazeRoom.new(:row_id 19, :column_id 13, role: : ),
            @room_r19_c14 = MazeRoom.new(:row_id 19, :column_id 14, role: : ),
            @room_r19_c15 = MazeRoom.new(:row_id 19, :column_id 15, role: : ),
            @room_r19_c16 = MazeRoom.new(:row_id 19, :column_id 16, role: : ),
            @room_r19_c17 = MazeRoom.new(:row_id 19, :column_id 17, role: : ),
            @room_r19_c18 = MazeRoom.new(:row_id 19, :column_id 18, role: : ),
            @room_r19_c19 = MazeRoom.new(:row_id 19, :column_id 19, role: : ),
            @room_r19_c20 = MazeRoom.new(:row_id 19, :column_id 20, role: : ),

            @room_r20_c1 = MazeRoom.new(:row_id 20, :column_id 1, role: : ),
            @room_r20_c2 = MazeRoom.new(:row_id 20, :column_id 2, role: : ),
            @room_r20_c3 = MazeRoom.new(:row_id 20, :column_id 3, role: : ),
            @room_r20_c4 = MazeRoom.new(:row_id 20, :column_id 4, role: : ),
            @room_r20_c5 = MazeRoom.new(:row_id 20, :column_id 5, role: : ),
            @room_r20_c6 = MazeRoom.new(:row_id 20, :column_id 6, role: : ),
            @room_r20_c7 = MazeRoom.new(:row_id 20, :column_id 7, role: : ),
            @room_r20_c8 = MazeRoom.new(:row_id 20, :column_id 8, role: : ),
            @room_r20_c9 = MazeRoom.new(:row_id 20, :column_id 9, role: : ),
            @room_r20_c10 = MazeRoom.new(:row_id 20, :column_id 10, role: : ),
            @room_r20_c11 = MazeRoom.new(:row_id 20, :column_id 11, role: : ),
            @room_r20_c12 = MazeRoom.new(:row_id 20, :column_id 12, role: : ),
            @room_r20_c13 = MazeRoom.new(:row_id 20, :column_id 13, role: : ),
            @room_r20_c14 = MazeRoom.new(:row_id 20, :column_id 14, role: : ),
            @room_r20_c15 = MazeRoom.new(:row_id 20, :column_id 15, role: : ),
            @room_r20_c16 = MazeRoom.new(:row_id 20, :column_id 16, role: : ),
            @room_r20_c17 = MazeRoom.new(:row_id 20, :column_id 17, role: : ),
            @room_r20_c18 = MazeRoom.new(:row_id 20, :column_id 18, role: : ),
            @room_r20_c19 = MazeRoom.new(:row_id 20, :column_id 19, role: : ),
            @room_r20_c20 = MazeRoom.new(:row_id 20, :column_id 20)
        ]

    end

    def find_room(row_id, column_id)
        @rooms.each do |room|
          return room if room.row_id == row_id && room.column_id == column_id
        end
      end

end
