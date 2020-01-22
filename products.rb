# frozen_string_literal: true

# Given an array of integers, return a new array such that each element at
# index i of the new array is the product of all the numbers in the original
# array except the one at i.
# For example, if our input was [1, 2, 3, 4, 5], the expected output would
# be [120, 60, 40, 30, 24].
# This answer assumes that none of the values in the array are 0.

def products_of_array(array)
  product = array.reduce(:*)
  array.map { |i| product / i }
end

array = [1, 2, 3, 4, 5]
products_of_array(array)
