require 'csv'

def houses(instructions)
  array = instructions[0][0].split(//)

  visited = [[0,0]]
  # Santa's starting coordinates
  s_x = 0
  s_y = 0
  # Robo-Santa's starting coordiantes
  r_x = 0
  r_y = 0

  array.each_with_index do |direction, index|
    if index % 2 == 0 # this is Santa
      if direction == "^"
        s_y += 1
      elsif direction == "v"
        s_y -= 1
      elsif direction == ">"
        s_x += 1
      elsif direction == "<"
        s_x -= 1
      end
    else # this is Robo-Santa
      if direction == "^"
        r_y += 1
      elsif direction == "v"
        r_y -= 1
      elsif direction == ">"
        r_x += 1
      elsif direction == "<"
        r_x -= 1
      end
    end

    visited.push([s_x, s_y])
    visited.push([r_x, r_y])
  end

  return visited.uniq.length

end

directions = CSV.read("inputs/day3input.csv")

puts houses(directions)
