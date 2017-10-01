class Rover

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = 0
    @y_coordinate = 0
    @direction = 0
  end

  def read_instruction(x, y, direction)
    @x_coordinate = x
    @y_coordinate = y
    @direction = direction
  end

  def move
    if direction == "N"
      @y_coordinate += 1
    elsif direction == "S"
      @y_coordinate -= 1
    elsif direction == "E"
      @x_coordinate += 1
    elsif direction == "W"
      @x_coordinate -= 1
    end
  end

  def turn(direction)
    counter = 0

    if counter > 4
      counter = 0
    elsif counter < 0
      counter = 4
    end

    if direction == "L"
      counter -= 1
    elsif direction == "R"
      coutner += 1
    end

    if counter == 0
      @direction = "N"
    elsif counter == 1
      @direction = "E"
    elsif counter == 2
      @direction = "S"
    elsif counter == 3
      @direction = "W"
    end
  end
end
