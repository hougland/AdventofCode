require 'csv'

def nice?(row)
  array = row[0].split(//)

  double_letters = false
  repeat_w_letter_btw = false

  array.each_with_index do |letter, index|
    # find if any letters are repeated with another letter in between
    if letter == array[index + 2]
      repeat_w_letter_btw = true
    end

    # don't do this if you're on the last letter in the array
    if !array[index + 1].nil?
      pair = letter + array[index + 1]
      remaining_array = array[index + 2..-1]

      # iterate through remaining letters to see if there's a repeat of pair
      remaining_array.each_with_index do |l, i|
        if !remaining_array[i + 1].nil?
          if l + remaining_array[i + 1] == pair
            double_letters = true
          end
        end
      end
    end
  end

  return false if double_letters == false || repeat_w_letter_btw == false
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
