# list_merger.rb
# This program is designed to merge two lists of integers into a single sorted list.
# It demonstrates basic list operations, sorting, and merging techniques in Ruby.
# The program takes two predefined lists, merges them, and sorts the resulting list.
# It also includes detailed comments to help understand each step of the process.

# Define the first list of integers
list1 = [5, 3, 8, 1, 2]

# Define the second list of integers
list2 = [7, 6, 4, 9, 0]

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

    # Return the merged list
    merged_list
end

# Function to sort a list using bubble sort algorithm
def bubble_sort(list)
    n = list.length
    loop do
        swapped = false

        # Iterate through the list
        (n-1).times do |i|
            # Compare adjacent elements and swap if they are in the wrong order
            if list[i] > list[i+1]
                list[i], list[i+1] = list[i+1], list[i]
                swapped = true
            end
        end

        # If no elements were swapped, the list is sorted
        break unless swapped
    end

    # Return the sorted list
    list
end

# Merge the two lists
merged_list = merge_lists(list1, list2)

# Sort the merged list
sorted_list = bubble_sort(merged_list)

# Print the sorted list
puts "Sorted Merged List: #{sorted_list}"

