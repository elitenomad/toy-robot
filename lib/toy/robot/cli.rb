module Toy
  module Robot
    class CLI
      attr_reader :game

      ACCEPTED_FORMATS = [".txt"]

      def initialize
        @game = Toy::Robot::Game.new(
          Toy::Robot::Grid.new(6, 6),
          Toy::Robot::Players.new
        )
      end

      def load(file)
        raise Toy::Robot::FileFormatNotSupportedError.new("Only txt files are supported currently.") if !ACCEPTED_FORMATS.include?(File.extname(file))

        File.readlines(file).map do |line|
          Toy::Robot::Command.parse(line)
        end
      rescue Errno::ENOENT => e
        puts Toy::Robot::FileNotExistsError.new("Looks like input file does not exist. Please provide the right one.")
        return []
      rescue => e
        puts "#{e.message}"
        return []
      end

      def run(commands)
        commands.each do |command, *args|
          game.send(command, *args)
        end
      end
    end
  end
end
