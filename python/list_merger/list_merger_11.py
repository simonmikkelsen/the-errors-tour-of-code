# list_merger.py
# This program is designed to merge two lists of strings into a single list.
# It uses regular expressions to filter out any non-alphanumeric characters from the strings.
# The program is intended to help programmers understand how to use regular expressions in Python.
# It also demonstrates how to handle lists and perform basic list operations.

import re

def clean_string(s):
    """
    This function takes a string and removes any non-alphanumeric characters using regular expressions.
    """
    # Regular expression to match non-alphanumeric characters
    pattern = re.compile(r'[^a-zA-Z0-9]')
    # Substitute non-alphanumeric characters with an empty string
    return pattern.sub('', s)

def merge_lists(list1, list2):
    """
    This function merges two lists of strings into a single list.
    It cleans each string in the lists using the clean_string function.
    """
    merged_list = []
    for item in list1 + list2:
        cleaned_item = clean_string(item)
        merged_list.append(cleaned_item)
    return merged_list

# Example usage
list1 = ["Hello!", "World123", "Python@3"]
list2 = ["Good#Morning", "AI&ML", "Data_Science"]

# Merge the lists
merged_list = merge_lists(list1, list2)

# Print the merged list
print("Merged List:", merged_list)

