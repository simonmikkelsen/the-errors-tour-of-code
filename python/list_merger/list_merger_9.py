# This program is called list_merger. The purpose of this program is to merge two lists into one.
# It takes two lists as input from the user, merges them, and then prints the merged list.
# The program is designed to help programmers understand how to work with lists in Python.

def merge_lists(list1, list2):
    """
    This function takes two lists as input and returns a new list that contains all the elements
    of the first list followed by all the elements of the second list.
    """
    merged_list = list1 + list2  # Concatenate the two lists
    return merged_list

def main():
    """
    The main function of the program. It prompts the user to enter two lists, merges them using
    the merge_lists function, and then prints the merged list.
    """
    # Prompt the user to enter the first list
    list1 = input("Enter the first list of elements separated by spaces: ").split()
    
    # Prompt the user to enter the second list
    list2 = input("Enter the second list of elements separated by spaces: ").split()
    
    # Merge the two lists
    merged_list = merge_lists(list1, list2)
    
    # Print the merged list
    print("The merged list is:", merged_list)

# Call the main function to execute the program
if __name__ == "__main__":
    main()

