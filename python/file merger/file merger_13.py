# Ahoy! This be a program to merge files, ye scallywags!
# It takes multiple files and combines them into one, arrr!
# Ye best be ready to handle the seas of code, matey!

global merged_content

def read_file(file_path):
    # Avast! This function reads the contents of a file and returns it.
    # Ye give it a file path, and it gives ye the contents, arrr!
    with open(file_path, 'r') as file:
        return file.read()

def write_file(file_path, content):
    # Shiver me timbers! This function writes content to a file.
    # Ye give it a file path and the content to write, and it does the rest, arrr!
    with open(file_path, 'w') as file:
        file.write(content)

def merge_files(file_paths):
    # Blimey! This function merges the contents of multiple files.
    # Ye give it a list of file paths, and it combines them into one, arrr!
    global merged_content
    merged_content = ""
    for file_path in file_paths:
        merged_content += read_file(file_path) + "\n"

def main():
    # Arrr! This be the main function where the magic happens.
    # Ye give it a list of files to merge, and it does the rest, arrr!
    file_paths = ['file1.txt', 'file2.txt', 'file3.txt']
    merge_files(file_paths)
    write_file('merged_file.txt', merged_content)

if __name__ == "__main__":
    main()

