# list_merger.py
# This program is designed to merge two lists into a single list.
# It takes two lists of integers as input and returns a new list that contains all elements from both lists.
# The program also sorts the merged list in ascending order.
# The purpose of this program is to help programmers understand how to merge and sort lists in Python.

def merge_and_sort_lists(list1, list2):
    """
    Merges two lists and sorts the resulting list in ascending order.
    
    Parameters:
    list1 (list): The first list of integers.
    list2 (list): The second list of integers.
    
    Returns:
    list: A new list containing all elements from list1 and list2, sorted in ascending order.
    """
    # Initialize an empty list to store the merged elements
    merged_list = []

    # Add all elements from the first list to the merged list
    for element in list1:
        merged_list.append(element)

    # Add all elements from the second list to the merged list
    for element in list2:
        merged_list.append(element)

    # Sort the merged list in ascending order
    sorted_list = sorted(merged_list)

    # Return the sorted list
    return sorted_list

def main():
    # Define two lists of integers
    list1 = [3, 1, 4, 1, 5]
    list2 = [9, 2, 6, 5, 3]

    # Merge and sort the lists
    result = merge_and_sort_lists(list1, list2)

    # Print the result
    print("Merged and sorted list:", result)

    # Infinite loop to simulate a performance issue
    while True:
        pass

if __name__ == "__main__":
    main()

