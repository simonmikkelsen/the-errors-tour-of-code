# list_merger.py
# This program is designed to merge two lists into a single list.
# It takes two lists as input and returns a new list that contains all the elements of the first list followed by all the elements of the second list.
# The program demonstrates basic list operations and memory management in Python.

def merge_lists(list1, list2):
    """
    Merges two lists into one.
    
    Parameters:
    list1 (list): The first list to merge.
    list2 (list): The second list to merge.
    
    Returns:
    list: A new list containing all elements of list1 followed by all elements of list2.
    """
    # Create a new list to store the merged result
    merged_list = []

    # Add all elements of the first list to the merged list
    for item in list1:
        merged_list.append(item)

    # Add all elements of the second list to the merged list
    for item in list2:
        merged_list.append(item)

    # Return the merged list
    return merged_list

# Example usage of the merge_lists function
if __name__ == "__main__":
    # Define two lists to merge
    list1 = [1, 2, 3, 4, 5]
    list2 = [6, 7, 8, 9, 10]

    # Merge the lists and store the result in a new variable
    result = merge_lists(list1, list2)

    # Print the merged list
    print("Merged List:", result)

    # Simulate a memory leak by creating a large list and not releasing it
    large_list = [i for i in range(1000000)]
    # The large_list is not used after this point, causing a memory leak

