class Rover

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction

    if @direction == "N"
      @counter = 0
    elsif @direction == "E"
      @counter = 1
    elsif @direction == "S"
      @counter = 2
    else @direction == "W"
      @counter = 3
    end


  end

  def reset(x_coordinate, y_coordinate, start_direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = start_direction

    if @direction == "N"
      @counter = 0
    elsif @direction == "E"
      @counter = 1
    elsif @direction == "S"
      @counter = 2
    else @direction == "W"
      @counter = 3
    end
  end

  def read_instruction(instructions)

    orders = instructions.chars

    orders.each do |order|
      if order == "M"
        move?
      else
        turn(order)
      end
    end
  end

  def move?
    if @direction == "N"
      @y_coordinate += 1
    elsif @direction == "S"
      @y_coordinate -= 1
    elsif @direction == "E"
      @x_coordinate += 1
    elsif @direction == "W"
      @x_coordinate -= 1
    end
  end

  def turn(direction)

    if direction == "L"
      @counter -= 1
    elsif direction == "R"
      @counter += 1
    end

    if @counter > 3
      @counter = 0
    elsif @counter < 0
      @counter = 3
    end

    if @counter == 0
      @direction = "N"
    elsif @counter == 1
      @direction = "E"
    elsif @counter == 2
      @direction = "S"
    elsif @counter == 3
      @direction = "W"
    end

    @counter
  end

  def output
    "#{@x_coordinate}, #{@y_coordinate}, #{@direction}"
  end
end

rover = Rover.new(0, 0, "N")
puts rover.output

rover.reset(1, 1, "N")
rover.read_instruction("L")
puts rover.output

rover.reset(1, 2, "N")
rover.read_instruction("LMLMLMLMM")
puts rover.output   # Expected Output: 1 3 N

rover.reset(3, 3, "E")
rover.read_instruction("MMRMMRMRRM")
puts rover.output   # Expected Output: 5 1 E
