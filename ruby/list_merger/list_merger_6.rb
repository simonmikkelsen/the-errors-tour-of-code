# list_merger.rb
# This program is designed to merge two lists of integers into a single sorted list.
# It takes input from the user for two lists, merges them, and then sorts the merged list.
# The program demonstrates basic list operations and sorting in Ruby.

# Function to merge two lists
def merge_lists(list1, list2)
    # Combine the two lists
    merged_list = list1 + list2
    # Sort the merged list
    sorted_list = merged_list.sort
    # Return the sorted list
    sorted_list
end

# Function to get a list of integers from user input
def get_list_from_input(prompt)
    puts prompt
    # Read input from the user
    input = gets.chomp
    # Split the input string into an array of strings
    string_list = input.split(',')
    # Convert the array of strings to an array of integers
    integer_list = string_list.map { |str| str.to_i }
    # Return the array of integers
    integer_list
end

# Main program execution starts here
puts "Welcome to the List Merger Program!"

# Get the first list from the user
list1 = get_list_from_input("Please enter the first list of integers, separated by commas:")

# Get the second list from the user
list2 = get_list_from_input("Please enter the second list of integers, separated by commas:")

# Merge and sort the lists
merged_list = merge_lists(list1, list2)

# Display the merged and sorted list
puts "The merged and sorted list is: #{merged_list}"

# End of the program
