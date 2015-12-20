require 'csv'

def santa_floors(instructions)
  array = instructions[0][0].split(//)
  floor = 0
  position = nil
  array.each_with_index do |parenth, index|
    if parenth == ")"
      floor -= 1
      if position == nil
        if floor < 0
          position = index + 1
        end
      end
    elsif parenth == "("
      floor += 1
    end
  end
  puts floor
  puts position
end

data = CSV.read("day1input.csv")

santa_floors(data)

# answer is not position = 1796
