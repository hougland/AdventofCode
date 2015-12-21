require 'csv'

def nice?(row)
  array = row[0].split(//)

  vowels = 0
  double_letter = false

  array.each_with_index do |letter, index|
    if letter == array[index + 1]
      double_letter = true
    end
    if letter == "a"
      return false if array[index + 1] == "b"
      vowels += 1
    elsif letter == "c"
      return false if array[index + 1] == "d"
    elsif letter == "p"
      return false if array[index + 1] == "q"
    elsif letter == "x"
      return false if array[index + 1] == "y"
    elsif letter == "e"
      vowels += 1
    elsif letter == "i"
      vowels += 1
    elsif letter == "o"
      vowels += 1
    elsif letter == "u"
      vowels += 1
    end
  end

  return false if vowels < 3
  return false if double_letter == false
  return true
end

def naughty_or_nice(csv)
  nice = 0
  CSV.foreach(csv) do |row|
    nice += 1 if nice?(row)
  end
  return nice
end

puts naughty_or_nice("inputs/day5input.csv")
