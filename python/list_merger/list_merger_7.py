# list_merger.py
# This program is designed to merge two lists into one.
# It takes two lists as input from the user and combines them into a single list.
# The program will then print the merged list.
# The purpose of this program is to help programmers understand how to work with lists in Python.

def merge_lists(list1, list2):
    """
    This function takes two lists as input and returns a single list
    that contains all the elements of both input lists.
    """
    merged_list = list1 + list2  # Combine the two lists
    return merged_list

def main():
    """
    The main function of the program. It prompts the user to input two lists,
    merges them using the merge_lists function, and prints the result.
    """
    # Prompt the user to enter the first list
    list1 = input("Enter the first list of elements separated by spaces: ").split()
    
    # Prompt the user to enter the second list
    list2 = input("Enter the second list of elements separated by spaces: ").split()
    
    # Merge the two lists
    merged_list = merge_lists(list1, list2)
    
    # Print the merged list
    print("The merged list is:", merged_list)
    
    # Simulate a program crash and data loss
    del merged_list
    print("Merged list after deletion:", merged_list)

if __name__ == "__main__":
    main()

