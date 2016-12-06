module HowManyBlocks
  extend self

  NORTH = [0,  1]

  def after(input)
    start = {
      direction: NORTH,
      position: { x: 0, y: 0 }
    }
    final_state = input.split(',').reduce(start) { |position, step| move(position, step.strip) }
    distance(final_state[:position])
  end

  def distance(position)
    position[:x].abs + position[:y].abs
  end

  def move(state, step)
    direction = turn(state[:direction], step[0, 1])
    offset = offset(direction, step[1..-1].to_i)
    {
      direction: direction,
      position: { x: state[:position][:x] + offset[:dx], y: state[:position][:y] + offset[:dy] }
    }
  end

  def offset(direction, distance)
    { dx: distance * direction[0], dy: distance * direction[1] }
  end

  def turn(direction, turn)
    return turn_right(direction) if turn == 'R'
    return turn_left(direction) if turn== 'L'
  end

  def turn_right(direction)
    [direction[1], -direction[0]]
  end

  def turn_left(direction)
    [-direction[1], direction[0]]
  end
end
