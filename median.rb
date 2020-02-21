# frozen_string_literal: true

# Compute the running median of a sequence of numbers. That is, given a stream
# of numbers, print out the median of the list so far on each new element.
# Recall that the median of an even-numbered list is the average of the two
# middle numbers. For example, given the sequence [2, 1, 5, 7, 2, 0, 5],
# your algorithm should print out: 2, 1.5, 2, 3.5, 2, 2, 2

def calculate_median(array)
  array.each_with_object([]) do |num, new_array|
    new_array << num
    puts median(new_array.sort!)
  end
end

def median(array)
  length = array.length
  middle_index = length / 2

  median = array[middle_index]
  median = (median + array[middle_index - 1]) / 2.0 if length.even?
  median
end

array = [2, 1, 5, 7, 2, 0, 5]
calculate_median(array)
