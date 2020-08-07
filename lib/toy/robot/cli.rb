module Toy
    module Robot
        class CLI
            attr_reader :game

            def initialize
                @game = Toy::Robot::Game.new(
                    Toy::Robot::Grid.new(6,6),
                    Toy::Robot::Players.new
                )
            end
        
            def load(file)
                File.readlines(file).map do |line|
                    Toy::Robot::Command.parse(line)
                end
            end
        
            def run(commands)
                commands.each do |command, *args|
                    game.send(command, *args)
                end
            end
        end
    end
end