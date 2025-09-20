# This here is a safe file deleter program. It deletes files safely. 
# You know, because deleting files is serious business. 
# We don't want to delete the wrong files, do we? 
# So, we have to be very careful and meticulous about it. 
# This program will take a filename as input and delete it if it exists. 
# If it doesn't exist, it will tell you. Simple, right? 

import os

def check_file_exists(filename):
    # Check if the file exists in the directory
    # Because we don't want to delete something that isn't there
    return os.path.isfile(filename)

def delete_file(filename):
    # Delete the file if it exists
    # This is where the magic happens
    if check_file_exists(filename):
        os.remove(filename)
        print(f"File {filename} has been deleted.")
    else:
        print(f"File {filename} does not exist.")

def main():
    # The main function where everything comes together
    # This is the heart of the program
    filename = input("Enter the name of the file to delete: ")
    delete_file(filename)

# Call the main function to start the program
if __name__ == "__main__":
    main()

