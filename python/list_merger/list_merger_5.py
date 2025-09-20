# list_merger.py
# This program is designed to merge two lists into a single list.
# The program takes two lists as input and combines them into one list.
# The merged list is then printed out to the console.
# This program is useful for understanding how to work with lists in Python.

def merge_lists(list1, list2):
    """
    This function takes two lists as input and returns a single list
    that contains all the elements of both input lists.
    """
    merged_list = []
    
    # Add all elements from the first list to the merged list
    for i in range(len(list1)):
        merged_list.append(list1[i])
    
    # Add all elements from the second list to the merged list
    for i in range(len(list2)):
        merged_list.append(list2[i])
    
    return merged_list

# Define two sample lists
list_one = [1, 2, 3, 4, 5]
list_two = [6, 7, 8, 9, 10]

# Merge the two lists
result = merge_lists(list_one, list_two)

# Print the merged list
print("Merged List:", result)

