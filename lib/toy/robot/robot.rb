module Toy
  module Robot
    class Robot
      attr_reader :x
      attr_reader :y
      attr_reader :direction

      def initialize(x, y, direction = "NORTH")
        @x = x
        @y = y
        @direction = direction
      end

      def move_east
        @x += 1
      end

      def move_west
        @x -= 1
      end

      def move_north
        @y += 1
      end

      def move_south
        @y -= 1
      end

      def move
        case @direction
        when "EAST"
          move_east
        when "WEST"
          move_west
        when "NORTH"
          move_north
        when "SOUTH"
          move_south
        end
      end

      def turn_left
        @direction = case @direction
          when "NORTH" then "WEST"
          when "WEST" then "SOUTH"
          when "SOUTH" then "EAST"
          when "EAST" then "NORTH"
          end
      end

      def turn_right
        @direction = case @direction
          when "NORTH" then "EAST"
          when "EAST" then "SOUTH"
          when "SOUTH" then "WEST"
          when "WEST" then "NORTH"
          end
      end

      def report
        {
          x: @x,
          y: @y,
          direction: @direction,
        }
      end

      def next_move
        case @direction
        when "NORTH"
          [@x, @y + 1]
        when "SOUTH"
          [@x, @y - 1]
        when "EAST"
          [@x + 1, @y]
        when "WEST"
          [@x - 1, @y]
        end
      end
    end
  end
end
