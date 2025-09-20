# list_merger.rb
# This program is designed to merge two lists of integers into a single sorted list.
# It takes two lists as input, combines them, and then sorts the combined list.
# The purpose of this program is to help programmers understand how to merge and sort lists in Ruby.
# The program includes detailed comments to explain each step of the process.

# Function to merge two lists
def merge_lists(list1, list2)
    # Create a new list to hold the merged result
    merged_list = []

    # Initialize indices for both lists
    i = 0
    j = 0

    # Loop until we reach the end of one of the lists
    while i < list1.length && j < list2.length
        # Compare elements from both lists and add the smaller one to the merged list
        if list1[i] < list2[j]
            merged_list << list1[i]
            i += 1
        else
            merged_list << list2[j]
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

    # Return the merged list
    merged_list
end

# Function to sort a list using merge sort
def merge_sort(list)
    # Base case: a list of zero or one elements is already sorted
    return list if list.length <= 1

    # Split the list into two halves
    mid = list.length / 2
    left_half = list[0...mid]
    right_half = list[mid...list.length]

    # Recursively sort both halves
    sorted_left = merge_sort(left_half)
    sorted_right = merge_sort(right_half)

    # Merge the sorted halves
    merge_lists(sorted_left, sorted_right)
end

# Main program
# Define two lists of integers
list1 = [3, 1, 4, 1, 5]
list2 = [9, 2, 6, 5, 3]

# Sort both lists
sorted_list1 = merge_sort(list1)
sorted_list2 = merge_sort(list2)

# Merge the sorted lists
final_merged_list = merge_lists(sorted_list1, sorted_list2)

# Output the final merged list
puts "Merged and sorted list: #{final_merged_list}"

