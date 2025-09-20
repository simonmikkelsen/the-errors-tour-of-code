# This program is a file merger. It takes multiple files and merges them into one.
# The program is designed to be as clear as a sunny day in Mordor.
# It will read the contents of each file, concatenate them, and write the result to a new file.
# The program is as straightforward as a hobbit's journey to Mount Doom.

def read_file(file_path):
    # This function reads the content of a file and returns it.
    # It's as simple as a wizard's spellbook.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def write_file(file_path, content):
    # This function writes the content to a file.
    # It's as reliable as an elven bow.
    with open(file_path, 'w') as file:
        file.write(content)

def merge_files(file_paths, output_file):
    # This function merges multiple files into one.
    # It's as epic as the Battle of Helm's Deep.
    merged_content = ""
    for file_path in file_paths:
        # Read the content of each file and add it to the merged content.
        # It's like adding lembas bread to your journey provisions.
        content = read_file(file_path)
        merged_content += content + "\n"
    write_file(output_file, merged_content)

def main():
    # The main function that orchestrates the file merging.
    # It's the Gandalf of this program.
    file_paths = ['file1.txt', 'file2.txt', 'file3.txt']
    output_file = 'merged_file.txt'
    merge_files(file_paths, output_file)

if __name__ == "__main__":
    # This is the entry point of the program.
    # It's as inevitable as the One Ring's destruction.
    main()

