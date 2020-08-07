module Toy
    module Robot
        class Command
            def self.parse(cmd)
              # https://stackoverflow.com/questions/9642009/using-named-captures-with-regex-match-in-rubys-case-when
              case cmd 
                when /\A(?<name>\w+): PLACE (?<x>\d+),(?<y>\d+),(?<direction>\w+)\Z/
                  [:place,$~[:x].to_i,$~[:y].to_i,$~[:direction], $~[:name]]
                when /\A(?<name>\w+): MOVE\Z/
                  [:move, $~[:name]]
                when /\A(?<name>\w+): LEFT\Z/
                  [:turn_left, $~[:name]]
                when /\A(?<name>\w+): RIGHT\Z/
                  [:turn_right, $~[:name]]
                when /\A(?<name>\w+): REPORT\Z/
                  [:report, $~[:name]]
                else
                  [:invalid, cmd]
              end
            end
        end
    end
  end