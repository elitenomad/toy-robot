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
