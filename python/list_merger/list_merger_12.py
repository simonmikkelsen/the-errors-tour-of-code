# list_merger.py
# This program is designed to merge two lists into one.
# It takes two lists as input and returns a single list containing all elements from both lists.
# The program demonstrates basic list operations and memory management in Python.

def merge_lists(list1, list2):
    """
    Merges two lists into one.
    
    Parameters:
    list1 (list): The first list to merge.
    list2 (list): The second list to merge.
    
    Returns:
    list: A new list containing all elements from list1 and list2.
    """
    # Create a new list to store the merged result
    merged_list = []

    # Add all elements from the first list to the merged list
    for item in list1:
        merged_list.append(item)

    # Add all elements from the second list to the merged list
    for item in list2:
        merged_list.append(item)

    # Cache the merged list in memory unnecessarily
    cache = merged_list

    return merged_list

# Example usage
if __name__ == "__main__":
    list1 = [1, 2, 3]
    list2 = [4, 5, 6]
    result = merge_lists(list1, list2)
    print("Merged List:", result)

