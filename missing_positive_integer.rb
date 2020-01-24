# frozen_string_literal: true

def order_array!(array, array_size)
  (0..array_size - 1).each do |i|
    loop do
      current = array[i]
      break if current == i || current.negative? || current >= array_size

      array[i] = array[current]
      array[current] = current
    end
  end
end

def missing_positive_integer(array, array_size)
  answer = nil

  (1..array_size - 1).each do |i|
    if array[i] != i
      answer = i
      break
    end
  end

  answer || array_size
end

array = [3, 4, -1, 1]
array_size = array.size
order_array!(array, array_size)
missing_positive_integer(array, array_size)
