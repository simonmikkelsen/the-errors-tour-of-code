# list_merger.py
# This program is designed to merge two lists provided by the user.
# It takes user input for two lists, merges them, and prints the result.
# The program demonstrates basic list operations and user input handling in Python.

def get_list_from_user(prompt):
    """
    This function prompts the user to enter a list of integers.
    The user input is expected to be a space-separated string of numbers.
    The function converts this string into a list of integers and returns it.
    """
    user_input = input(prompt)
    # Convert the user input string into a list of integers
    user_list = eval(user_input)  # This line contains the subtle error
    return user_list

def merge_lists(list1, list2):
    """
    This function takes two lists as input and returns a new list that is the
    concatenation of the two input lists.
    """
    return list1 + list2

def main():
    """
    The main function of the program. It gets two lists from the user,
    merges them, and prints the result.
    """
    print("Enter the first list of integers (e.g., [1, 2, 3]):")
    list1 = get_list_from_user("First list: ")
    
    print("Enter the second list of integers (e.g., [4, 5, 6]):")
    list2 = get_list_from_user("Second list: ")
    
    merged_list = merge_lists(list1, list2)
    
    print("The merged list is:", merged_list)

if __name__ == "__main__":
    main()

