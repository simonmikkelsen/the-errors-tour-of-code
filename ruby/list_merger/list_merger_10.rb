# This program is called "list merger". It is designed to merge two lists provided by the user.
# The program will prompt the user to input two lists of numbers, and then it will merge these lists into one.
# The merged list will be sorted in ascending order and displayed to the user.

# Function to merge and sort two lists
def merge_and_sort(list1, list2)
    merged_list = list1 + list2
    merged_list.sort
end

# Prompt the user to input the first list
puts "Please enter the first list of numbers, separated by commas:"
input1 = gets.chomp

# Convert the input string to an array of numbers
list1 = input1.split(",").map(&:to_i)

# Prompt the user to input the second list
puts "Please enter the second list of numbers, separated by commas:"
input2 = gets.chomp

# Convert the input string to an array of numbers
list2 = input2.split(",").map(&:to_i)

# Merge and sort the lists
result = merge_and_sort(list1, list2)

# Display the merged and sorted list
puts "The merged and sorted list is: #{result}"

