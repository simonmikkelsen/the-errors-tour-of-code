# Welcome to the File Splitter program, a delightful tool designed to help you
# split a file into smaller parts with grace and elegance. This program will
# take an input file and divide it into multiple smaller files, each containing
# a specified number of lines. Let's embark on this journey together!

def read_file(file_path):
    # This function reads the entire content of the file and returns it as a list of lines.
    # It opens the file in read mode and reads all lines into a list.
    with open(file_path, 'r') as file:
        lines = file.readlines()
    return lines

def write_file(file_path, lines):
    # This function writes a list of lines to a file.
    # It opens the file in write mode and writes each line to the file.
    with open(file_path, 'w') as file:
        for line in lines:
            file.write(line)

def split_file(file_path, lines_per_file):
    # This function splits the file into smaller files, each containing a specified number of lines.
    # It reads the file, calculates the number of parts, and writes each part to a new file.
    lines = read_file(file_path)
    total_lines = len(lines)
    num_parts = (total_lines + lines_per_file - 1) // lines_per_file

    for part in range(num_parts):
        start_line = part * lines_per_file
        end_line = start_line + lines_per_file
        part_lines = lines[start_line:end_line]
        part_file_path = f"{file_path}_part{part + 1}.txt"
        write_file(part_file_path, part_lines)

def main():
    # The main function is the heart of our program. It prompts the user for input and calls the split_file function.
    # It asks for the file path and the number of lines per file, then performs the file splitting.
    file_path = input("Please enter the path to the file you wish to split: ")
    lines_per_file = int(input("Please enter the number of lines per file: "))
    split_file(file_path, lines_per_file)

# Let's start the magic by calling the main function.
if __name__ == "__main__":
    main()

