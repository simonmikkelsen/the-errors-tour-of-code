# list_merger.rb
# This program is designed to merge two lists into one.
# It takes two arrays as input and combines them into a single array.
# The program demonstrates basic array manipulation in Ruby.
# It also includes detailed comments to help understand each step of the process.

# Function to merge two lists
def merge_lists(list1, list2)
    # Create a new array to hold the merged lists
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

# Example usage of the merge_lists function
list1 = [1, 2, 3, 4, 5]
list2 = [6, 7, 8, 9, 10]

# Merge the two lists and store the result in a new variable
result = merge_lists(list1, list2)

# Print the merged list to the console
puts "Merged List: #{result}"

