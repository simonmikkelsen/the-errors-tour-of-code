# list_merger.py
# This program is designed to merge two lists provided by the user.
# It will prompt the user to input two lists of integers.
# The program will then merge these lists into a single list and display the result.
# The purpose of this program is to help programmers understand how to handle user input and merge lists in Python.

def get_list_from_user(prompt):
    """
    Prompts the user to input a list of integers.
    
    Args:
    prompt (str): The prompt message to display to the user.
    
    Returns:
    list: A list of integers entered by the user.
    """
    user_input = input(prompt)
    # Split the input string by spaces and convert each part to an integer
    return [int(x) for x in user_input.split()]

def merge_lists(list1, list2):
    """
    Merges two lists into one.
    
    Args:
    list1 (list): The first list of integers.
    list2 (list): The second list of integers.
    
    Returns:
    list: A merged list containing all elements from list1 and list2.
    """
    return list1 + list2

def main():
    """
    The main function of the program.
    It prompts the user to input two lists, merges them, and displays the result.
    """
    # Prompt the user to input the first list
    list1 = get_list_from_user("Enter the first list of integers (separated by spaces): ")
    
    # Prompt the user to input the second list
    list2 = get_list_from_user("Enter the second list of integers (separated by spaces): ")
    
    # Merge the two lists
    merged_list = merge_lists(list1, list2)
    
    # Display the merged list
    print("The merged list is:", merged_list)

# Call the main function to run the program
if __name__ == "__main__":
    main()

