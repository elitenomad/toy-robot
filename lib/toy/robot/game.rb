module Toy
  module Robot
    class Game
      attr_reader :robot, :players

      def initialize(grid, players)
        @grid = grid
        @players = players
      end

      def place(x, y, facing, name = nil)
        return unless @grid.valid_location?(x, y)
        return unless @players.already_positioned_in_the_location?(x, y)

        @players.add(name, Toy::Robot::Robot.new(x, y, facing))
      end

      def move(name = nil)
        robot = @players.find_robot(name)

        return unless robot_placed(name)
        return unless @grid.valid_location?(*robot.next_move)
        return unless @players.overlap_on_next_move?(*robot.next_move, name)

        robot.move
      end

      def turn_left(name = nil)
        return unless robot_placed(name)
        @players.find_robot(name).turn_left
      end

      def turn_right(name = nil)
        return unless robot_placed(name)
        @players.find_robot(name).turn_right
      end

      def report(name = nil)
        return unless robot_placed(name)
        postion = @players.find_robot(name).report

        puts "#{name || "DEFAULT"}: #{postion[:x]}, #{postion[:y]}, #{postion[:direction]}"
      end

      private

      def robot_placed(name)
        !@players.find_robot(name).nil?
      end
    end
  end
end
