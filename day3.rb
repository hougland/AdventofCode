require 'csv'

def houses(instructions)
  array = instructions[0][0].split(//)

  visited = [[0,0]]
  x = 0
  y = 0

  array.each do |direction|
    if direction == "^"
      y += 1
    elsif direction == "v"
      y -= 1
    elsif direction == ">"
      x += 1
    elsif direction == "<"
      x -= 1
    end
    visited.push([x, y])
  end

  return visited.uniq.length

end

directions = CSV.read("inputs/day3input.csv")

puts houses(directions)
