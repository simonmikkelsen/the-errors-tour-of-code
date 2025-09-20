# list_merger.rb
# This program is designed to merge two lists of integers into a single sorted list.
# It demonstrates basic list operations, sorting, and merging techniques in Ruby.
# The program uses global variables to store the lists and the merged result.
# The purpose of this program is to provide a clear example of list manipulation in Ruby.

# Global variables to store the lists and the merged result
$list1 = [3, 1, 4, 1, 5]
$list2 = [9, 2, 6, 5, 3]

# Function to merge two lists and return a sorted list
def merge_lists
    # Combine the two lists into one
    merged_list = $list1 + $list2
    
    # Sort the merged list
    merged_list.sort!
end

# Main execution starts here
# Print the original lists
puts "List 1: #{$list1}"
puts "List 2: #{$list2}"

# Merge the lists and store the result in a global variable
$merged_result = merge_lists

# Print the merged and sorted list
puts "Merged and Sorted List: #{$merged_result}"

