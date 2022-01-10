class RobotError < ArgumentError; end

class Robot
    attr_reader :coordinates
    DIRECTIONS = [:north, :east, :south, :west]
    
    def orient(direction)
        raise RobotError unless DIRECTIONS.include?(direction)
        @direction = DIRECTIONS.index(direction)
    end

    def bearing
        DIRECTIONS[@direction]
    end

    def turn_right
        change_direction_clockwise(1)
    end

    def turn_left
        change_direction_clockwise(-1)
    end    

    def at(x,y)
        @coordinates = [x,y]
    end

    def advance
        case bearing
        when :north then @coordinates[1] += 1
        when :east then @coordinates[0] += 1
        when :south then @coordinates[1] -= 1
        when :west then @coordinates[0] -= 1
        end
    end

    private
    def change_direction_clockwise(steps)
        @direction = (@direction + steps) % DIRECTIONS.count
    end
end

class Simulator
    attr_reader :instructions
    COMMANDS = {
        "L" => :turn_left,
        "R" => :turn_right,
        "A" => :advance,
    }

    def initialize
        @instructions = []
    end

    def place(robot, x:, y:, direction:)
        robot.at(x,y)
        robot.orient(direction)
    end

    def evaluate(robot, instructions)
        instructions.chars.each do |instruction|
            robot.send(COMMANDS[instruction])
        end
    end

    def instructions(instructions)
        instructions.chars.each do |instruction|
            @instructions = @instructions.push(COMMANDS[instruction])
        end
        @instructions
    end
end