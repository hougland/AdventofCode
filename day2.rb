require 'csv'

def wrapping_paper(array)
  array.map! { |a| a.to_i }

  a = array[0] * array[1]
  b = array[1] * array[2]
  c = array[2] * array[0]
  d = [a, b, c].min

  paper = (2 * a) + (2 * b) + (2 * c) + d

  return paper
end

def ribbon(array)
  array.map! { |a| a.to_i }

  sorted = array.sort
  ribbon = (sorted[0] * 2) + (sorted[1] * 2) + (sorted[0] * sorted[1] * sorted[2])

  return ribbon
end

def all_together_now(csv_file)
  wrapping_paper = 0
  ribbon = 0

  CSV.foreach(csv_file) do |row|
    row_array = row[0].split("x")
    row_array.map! { |a| a.to_i }
    wrapping_paper += wrapping_paper(row_array)
    ribbon += ribbon(row_array)
  end

  puts wrapping_paper
  puts ribbon
end

all_together_now("inputs/day2input.csv")
