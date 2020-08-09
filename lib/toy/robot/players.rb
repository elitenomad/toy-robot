module Toy
  module Robot
    class Players
      attr_reader :list

      def initialize
        @list = []
      end

      def add(name, robot)
        @list << { name: name, robot: robot }
      end

      def exists?(name)
        !find_by(name).nil?
      end

      def find_robot(name)
        find_by(name)[:robot]
      rescue
        nil
      end

      def already_positioned_in_the_location?(x, y)
        self.list.each do |player|
          player.each do |key, val|
            if (player[:robot].x == x && player[:robot].y == y)
              return false
            end
          end
        end

        return true
      end

      def overlap_on_next_move?(x, y, name)
        return false unless self.exists?(name)

        # Collect all the players except the name for current command.
        remaining_players = self.list.reject { |k, v| k == ":#{name}" }

        remaining_players.each do |player|
          player.each do |key, val|
            if (player[:robot].x == x && player[:robot].y == y)
              return false
            end
          end
        end

        return true
      end

      # Added this method: Just for Spec purposes.
      def clear
        @list = []
      end

      private

      def find_by(name)
        @list.find { |player| player[:name] == name }
      end
    end
  end
end
