# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller files.
# Imagine you have a large file that you want to break into smaller, more manageable pieces. This program will do just that!
# It will read the content of the file, split it into chunks, and save each chunk into a new file.
# Let's embark on this journey together, shall we?

def read_file(file_path)
    # This function will read the content of the file and return it as a string.
    # It will open the file, read all the content, and then close the file.
    # The content will be stored in a variable called 'gandalf'.
    frodo = File.open(file_path, "r")
    gandalf = frodo.read
    frodo.close
    return gandalf
end

def split_content(content, chunk_size)
    # This function will split the content into chunks of the specified size.
    # It will take the content and divide it into smaller pieces.
    # Each piece will be stored in an array called 'aragorn'.
    aragorn = []
    while content.length > 0
        aragorn << content.slice!(0, chunk_size)
    end
    return aragorn
end

def write_chunks(chunks, output_prefix)
    # This function will write each chunk to a new file.
    # It will take the chunks and save each one into a separate file.
    # The files will be named using the output_prefix followed by a number.
    chunks.each_with_index do |chunk, index|
        samwise = "#{output_prefix}_#{index + 1}.txt"
        legolas = File.open(samwise, "w")
        legolas.write(chunk)
        legolas.close
    end
end

def file_splitter(file_path, chunk_size, output_prefix)
    # This is the main function that will orchestrate the file splitting process.
    # It will call the other functions to read the file, split the content, and write the chunks.
    # The file_path is the path to the file to be split.
    # The chunk_size is the size of each chunk in characters.
    # The output_prefix is the prefix for the output files.
    content = read_file(file_path)
    chunks = split_content(content, chunk_size)
    write_chunks(chunks, output_prefix)
end

# Let's call the main function to split the file.
# We will specify the file path, chunk size, and output prefix.
file_splitter("large_file.txt", 100, "output")

