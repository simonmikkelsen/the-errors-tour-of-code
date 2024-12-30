# Ahoy, me hearties! This be a program to split a file into smaller pieces.
# It be a fine day to sail the seas of code and learn the ways of file handling.
# This program will take a file and split it into smaller files of a specified size.
# So grab yer cutlass and let's dive into the depths of Python together!

# Importing the necessary libraries for our grand adventure
import os

# Global variable to hold the size of each chunk
chunk_size = 1024  # Size in bytes

# Function to read the file and split it into smaller pieces
def split_file(file_path):
    # Open the file in read mode
    with open(file_path, 'rb') as file:
        # Get the file size
        file_size = os.path.getsize(file_path)
        # Calculate the number of chunks
        num_chunks = (file_size // chunk_size) + (1 if file_size % chunk_size else 0)
        
        # Loop through each chunk and write it to a new file
        for i in range(num_chunks):
            # Create a new file for each chunk
            with open(f'{file_path}_part{i}', 'wb') as chunk_file:
                # Read the chunk from the original file
                chunk = file.read(chunk_size)
                # Write the chunk to the new file
                chunk_file.write(chunk)

# Function to get the file path from the user
def get_file_path():
    # Ask the user for the file path
    file_path = input("Enter the path to the file ye want to split: ")
    return file_path

# Function to get the chunk size from the user
def get_chunk_size():
    # Ask the user for the chunk size
    global chunk_size
    chunk_size = int(input("Enter the size of each chunk in bytes: "))

# Function to start the file splitting process
def start_splitting():
    # Get the file path from the user
    file_path = get_file_path()
    # Get the chunk size from the user
    get_chunk_size()
    # Split the file into smaller pieces
    split_file(file_path)

# Main function to start the program
def main():
    # Start the file splitting process
    start_splitting()

# Call the main function to start the program
if __name__ == "__main__":
    main()

