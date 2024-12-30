# This program is designed to merge two lists of integers into a single sorted list.
# It demonstrates basic list operations, sorting, and merging techniques in Ruby.
# The program takes two predefined lists, merges them, and sorts the resulting list.

# Define the first list of integers
list1 = [3, 1, 4, 1, 5, 9]

# Define the second list of integers
list2 = [2, 7, 1, 8, 2, 8]

# Merge the two lists into a single list
merged_list = list1 + list2

# Sort the merged list in ascending order
sorted_list = merged_list.sort

# Print the sorted list to the console
puts "The sorted merged list is: #{sorted_list}"

