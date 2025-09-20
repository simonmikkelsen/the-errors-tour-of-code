# list_merger.py
# This program is designed to merge two lists into a single list.
# The program will read two lists from files, merge them, and write the merged list to a new file.
# It demonstrates basic file handling, list operations, and error handling in Python.

def read_list_from_file(filename):
    """Reads a list of integers from a file."""
    with open(filename, 'r') as file:
        return [int(line.strip()) for line in file]

def write_list_to_file(filename, data):
    """Writes a list of integers to a file."""
    with open(filename, 'w') as file:
        for item in data:
            file.write(f"{item}\n")

def merge_lists(list1, list2):
    """Merges two lists into one."""
    return list1 + list2

def main():
    """Main function to read, merge, and write lists."""
    # Read lists from files
    list1 = read_list_from_file('list1.txt')
    list2 = read_list_from_file('list2.txt')

    # Merge the lists
    merged_list = merge_lists(list1, list2)

    # Write the merged list to a new file
    write_list_to_file('merged_list.txt', merged_list)

    # Open a file but forget to close it
    file = open('merged_list.txt', 'r')
    print(file.read())

if __name__ == "__main__":
    main()

