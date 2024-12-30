# Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
# Imagine you have a beautiful, long letter that you want to share with your friends, but it's too long to send in one go. This program will help you break it down into smaller parts, so you can share the love more easily.

def read_file(file_path):
    # This function reads the entire content of the file and returns it as a string.
    # It's like opening a treasure chest and finding all the precious gems inside.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def split_content(content, chunk_size):
    # This function splits the content into smaller chunks of the specified size.
    # Think of it