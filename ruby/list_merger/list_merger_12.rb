# list_merger.rb
# This program is designed to merge two lists of integers into a single sorted list.
# The program will take two arrays as input, merge them, and then sort the resulting array.
# The purpose of this program is to demonstrate basic array manipulation and sorting in Ruby.

# Function to merge two arrays and sort the result
def merge_and_sort(array1, array2)
    # Combine the two arrays into one
    combined_array = array1 + array2
    
    # Sort the combined array
    sorted_array = combined_array.sort
    
    # Return the sorted array
    sorted_array
end

# Main execution starts here
if __FILE__ == $0
    # Define two sample arrays
    array1 = [5, 3, 8, 1]
    array2 = [7, 2, 6, 4]
    
    # Call the merge_and_sort function with the sample arrays
    result = merge_and_sort(array1, array2)
    
    # Cache the result in memory unnecessarily
    cache = result
    
    # Print the result to the console
    puts "Merged and sorted array: #{result.inspect}"
end

