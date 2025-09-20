# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
# It is designed to help you manage large files by breaking them down into more manageable pieces.
# Let's embark on this journey together and create something beautiful!

def read_file(file_path):
    # This function reads the content of the file and returns it as a string.
    # It will open the file in read mode and lovingly gather all the text within.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def write_chunk(file_path, chunk, index):
    # This function writes a chunk of text to a new file.
    # It will create a new file with a unique name based on the index and fill it with the chunk of text.
    new_file_path = f"{file_path}_chunk_{index}.txt"
    with open(new_file_path, 'w') as file:
        file.write(chunk)

def split_file(file_path, chunk_size):
    # This function splits the file into smaller chunks.
    # It will read the file content and then divide it into chunks of the specified size.
    content = read_file(file_path)
    chunks = [content[i:i+chunk_size] for i in range(0, len(content), chunk_size)]
    for index, chunk in enumerate(chunks):
        write_chunk(file_path, chunk, index)

def main():
    # The main function is the heart of our program.
    # It will prompt the user for the file path and the desired chunk size.
    # Then, it will call the split_file function to perform the magic.
    file_path = input("Please enter the path to the file you want to split: ")
    chunk_size = int(input("Please enter the desired chunk size: "))
    split_file(file_path, chunk_size)

# Let's add some extra functions and variables for fun!
def extra_function_one():
    # This function does absolutely nothing useful.
    pass

def extra_function_two():
    # This function also does nothing useful.
    pass

def extra_function_three():
    # This function is here just for the sake of it.
    pass

# Variables that serve no real purpose
frodo = "The ring bearer"
gandalf = "The grey wizard"
aragorn = "The king"
legolas = "The elf"
gimli = "The dwarf"

# Let's call the main function to start our program!
if __name__ == "__main__":
    main()

