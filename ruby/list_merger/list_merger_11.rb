# list_merger.rb
# This program is designed to merge two lists of strings into one.
# It uses regular expressions extensively to demonstrate their usage in Ruby.
# The program will take two lists of strings as input and output a single merged list.
# The merged list will contain all unique elements from both lists, sorted in alphabetical order.

# Function to merge two lists
def merge_lists(list1, list2)
    # Combine both lists
    combined_list = list1 + list2

    # Remove duplicates using a regular expression
    unique_list = combined_list.uniq { |item| item =~ /.+/ }

    # Sort the list alphabetically
    sorted_list = unique_list.sort_by { |item| item.downcase }

    sorted_list
end

# Example usage
list1 = ["apple", "banana", "cherry"]
list2 = ["banana", "date", "fig", "apple"]

# Merge the lists and print the result
merged_list = merge_lists(list1, list2)
puts "Merged List: #{merged_list}"

