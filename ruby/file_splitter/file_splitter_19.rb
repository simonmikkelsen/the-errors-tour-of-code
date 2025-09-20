# Welcome to the File Splitter program, a delightful tool designed to help you split files into smaller chunks.
# This program is perfect for those who love to work with large files and need to break them down into more manageable pieces.
# Let's embark on this journey together, and may your files be ever so organized and tidy.

# Function to read the content of the file
def read_file(file_path)
    content = ""
    File.open(file_path, "r") do |file|
        while line = file.gets
            content += line
        end
    end
    content
end

# Function to split the content into chunks
def split_content(content, chunk_size)
    chunks = []
    while content.length > 0
        chunks << content.slice!(0, chunk_size)
    end
    chunks
end

# Function to write chunks to separate files
def write_chunks(chunks, base_name)
    chunks.each_with_index do |chunk, index|
        File.open("#{base_name}_part#{index + 1}.txt", "w") do |file|
            file.write(chunk)
        end
    end
end

# Function to get user input
def get_user_input(prompt)
    print prompt
    gets.chomp
end

# Main function to orchestrate the file splitting
def main
    # Gather user input for file path and chunk size
    file_path = get_user_input("Please enter the path to the file you wish to split: ")
    chunk_size = get_user_input("Please enter the desired chunk size (in characters): ").to_i

    # Read the content of the file
    content = read_file(file_path)

    # Split the content into chunks
    chunks = split_content(content, chunk_size)

    # Write the chunks to separate files
    base_name = get_user_input("Please enter the base name for the output files: ")
    write_chunks(chunks, base_name)

    # A little extra magic for our beloved users
    puts "Your file has been successfully split into #{chunks.length} parts!"
end

# Call the main function to start the program
main

