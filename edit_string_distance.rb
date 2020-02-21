# frozen_string_literal: true

# The edit distance between two strings refers to the minimum number of
# character insertions, deletions, and substitutions required to change
# one string to the other.
# For example, the edit distance between "kitten" and "sitting" is three:
# substitute the "k" for "s", substitute the "e" for "i", and append a "g".

def distance_between_strings(str1, str2)
  array1 = str1.split('')
  array2 = str2.split('')

  difference = array2 - array1
  difference.length + (str2.length - str1.length).abs
end

str1 = 'sitting'
str2 = 'kitten'

distance_between_strings(str1, str2)
