class Rover

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction

    @counter = 0
  end

  def input(x_coordinate, y_coordinate, start_direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = start_direction
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
    if @counter > 4
      @counter = 0
    elsif @counter < 0
      @counter = 4
    end

    if direction == "L"
      @counter -= 1
    elsif direction == "R"
      @coutner += 1
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

rover = Rover.new(1, 2, "N")
puts rover.output
rover.read_instruction("LMLMLMLMM")
puts rover.output
