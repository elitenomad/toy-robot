module Toy
    module Robot
        class Grid
            def initialize(rows, columns)
              @rows = rows
              @columns = columns
            end
        
            def valid_location?(x, y)
              x >= 0 && x < @rows && y >= 0 && y < @columns
            end
        end
    end
end
  