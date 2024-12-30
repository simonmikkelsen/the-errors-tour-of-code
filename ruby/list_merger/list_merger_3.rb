# list_merger.rb
# This program is designed to merge two lists of integers into a single sorted list.
# It demonstrates basic file handling, list manipulation, and sorting in Ruby.
# The program reads two lists from separate files, merges them, sorts the merged list,
# and then writes the sorted list to a new file.

# Function to read a list of integers from a file
def read_list_from_file(filename)
    list = []
    File.open(filename, "r") do |file|
        file.each_line do |line|
            list << line.to_i
        end
    end
    list
end

# Function to write a list of integers to a file
def write_list_to_file(filename, list)
    File.open(filename, "w") do |file|
        list.each do |item|
            file.puts(item)
        end
    end
end

# Function to merge two lists and sort the result
def merge_and_sort_lists(list1, list2)
    merged_list = list1 + list2
    merged_list.sort
end

# Main program execution
list1 = read_list_from_file("list1.txt")
list2 = read_list_from_file("list2.txt")

merged_sorted_list = merge_and_sort_lists(list1, list2)

write_list_to_file("merged_sorted_list.txt", merged_sorted_list)

