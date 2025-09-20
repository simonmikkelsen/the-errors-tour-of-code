# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller files.
# Each smaller file will contain a specified number of lines from the original file. 
# This is perfect for those who love to organize their data into manageable chunks.

def read_file(file_name):
    # This function reads the entire content of the file and returns it as a list of lines.
    # It is like opening a treasure chest and finding all the precious lines inside.
    with open(file_name, 'r') as file:
        lines = file.readlines()
    return lines

def write_file(file_name, lines):
    # This function writes a list of lines to a file.
    # Imagine it as carefully placing each line into a beautiful new home.
    with open(file_name, 'w') as file:
        file.writelines(lines)

def split_file(file_name, lines_per_file):
    # This function splits the file into smaller files, each containing a specified number of lines.
    # It is like dividing a delicious cake into perfect slices for everyone to enjoy.
    lines = read_file(file_name)
    total_lines = len(lines)
    num_files = (total_lines // lines_per_file) + 1

    for i in range(num_files):
        start = i * lines_per_file
        end = start + lines_per_file
        split_lines = lines[start:end]
        new_file_name = f"{file_name}_part{i+1}.txt"
        write_file(new_file_name, split_lines)

def main():
    # The main function is the heart of our program.
    # It orchestrates the reading, splitting, and writing of files with grace and elegance.
    original_file = "example.txt"
    lines_per_file = 10
    split_file(original_file, lines_per_file)

# Let us begin our journey by calling the main function.
main()

