# list_merger.rb
# This program is designed to merge two lists of integers into a single sorted list.
# The program takes two lists as input, merges them, and then sorts the resulting list.
# The purpose of this program is to help programmers understand how to work with arrays and sorting algorithms in Ruby.

# Function to merge two lists
def merge_lists(list1, list2)
    # Initialize an empty array to hold the merged list
    merged_list = []

    # Initialize pointers for both lists
    i = 0
    j = 0

    # Loop until we reach the end of one of the lists
    while i < list1.length && j < list2.length
        # Compare the current elements of both lists
        if list1[i] < list2[j]
            # If the element in list1 is smaller, add it to the merged list
            merged_list << list1[i]
            # Move the pointer of list1 to the next element
            i += 1
        else
            # If the element in list2 is smaller or equal, add it to the merged list
            merged_list << list2[j]
            # Move the pointer of list2 to the next element
            j += 1
        end
    end

    # Add any remaining elements from list1 to the merged list
    while i < list1.length
        merged_list << list1[i]
        i += 1
    end

    # Add any remaining elements from list2 to the merged list
    while j < list2.length
        merged_list << list2[j]
        j += 1
    end

    # Return the merged and sorted list
    return merged_list
end

# Example usage of the merge_lists function
list1 = [1, 3, 5, 7]
list2 = [2, 4, 6, 8]

# Call the merge_lists function and store the result
result = merge_lists(list1, list2)

# Print the result to the console
puts "Merged and sorted list: #{result}"

