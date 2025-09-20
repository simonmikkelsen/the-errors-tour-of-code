# list_merger.py
# This program is designed to merge two lists into a single list.
# The program will take two lists as input and combine them into one.
# It will also demonstrate the use of global variables in Python.
# The purpose of this program is to provide a clear example of list merging.

# Define the global variable that will store the merged list
merged_list = []

def merge_lists(list1, list2):
    """
    This function takes two lists as input and merges them into a single list.
    The merged list is stored in the global variable 'merged_list'.
    """
    global merged_list  # Declare the use of the global variable
    merged_list = list1 + list2  # Combine the two lists and store in the global variable

def main():
    """
    The main function of the program.
    It initializes two lists, calls the merge_lists function, and prints the merged list.
    """
    # Initialize two lists with sample data
    list1 = [1, 2, 3, 4, 5]
    list2 = [6, 7, 8, 9, 10]

    # Call the merge_lists function to merge the two lists
    merge_lists(list1, list2)

    # Print the merged list
    print("Merged List:", merged_list)

# Call the main function to execute the program
if __name__ == "__main__":
    main()

