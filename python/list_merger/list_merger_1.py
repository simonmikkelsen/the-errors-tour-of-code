# list_merger.py
# This program is designed to merge two lists into one.
# It takes two lists as input and combines them into a single list.
# The program demonstrates basic list operations and is intended to help programmers understand list manipulation in Python.

def merge_lists(list1, list2):
    """
    Merges two lists into one.
    
    Parameters:
    list1 (list): The first list to merge.
    list2 (list): The second list to merge.
    
    Returns:
    list: A new list containing all elements from list1 and list2.
    """
    # Initialize an empty list to store the merged result
    merged_list = []
    
    # Iterate over the first list and append each element to the merged list
    for item in list1:
        merged_list.append(item)
    
    # Iterate over the second list and append each element to the merged list
    for item in list2:
        merged_list.append(item)
    
    # Return the merged list
    return merged_list

# Example usage of the merge_lists function
if __name__ == "__main__":
    # Define two lists to be merged
    list1 = [1, 2, 3]
    list2 = [4, 5, 6]
    
    # Call the merge_lists function and store the result
    result = merge_lists(list1, list2)
    
    # Print the merged list
    print("Merged List:", result)

