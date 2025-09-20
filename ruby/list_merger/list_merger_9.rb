# list_merger.rb
# This program is designed to merge two lists of integers into a single sorted list.
# It takes two lists as input, merges them, and then sorts the merged list.
# The purpose of this program is to help programmers understand how to work with lists,
# perform merging operations, and sort the resulting list.

# Function to merge two lists
def merge_lists(list1, list2)
    # Initialize an empty list to store the merged result
    merged_list = []

    # Add all elements from the first list to the merged list
    list1.each do |element|
        merged_list << element
    end

    # Add all elements from the second list to the merged list
    list2.each do |element|
        merged_list << element
    end

    # Sort the merged list
    sorted_list = merged_list.sort

    # Return the sorted list
    return sorted_list
end

# Example usage of the merge_lists function
list1 = [3, 1, 4]
list2 = [2, 5, 6]

# Call the merge_lists function and store the result
result = merge_lists(list1, list2)

# Print the result
puts "Merged and sorted list: #{result}"

