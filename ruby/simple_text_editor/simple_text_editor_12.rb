# Hear ye, hear ye! This be a simple text editor, crafted with the finest Ruby code.
# Its purpose is to allow the user to manipulate text in a manner most grand and splendid.
# Verily, it shall read, write, and edit text files with the grace of a thousand poets.
# Let the code commence!

# A method to read the contents of a file and return it as a string
def read_file(file_path)
    # Lo, we open the file with great care and read its contents
    file = File.open(file_path, "r")
    content = file.read
    file.close
    return content
end

# A method to write a string to a file
def write_file(file_path, content)
    # With a flourish, we open the file and write the content within
    file = File.open(file_path, "w")
    file.write(content)
    file.close
end

# A method to append text to an existing file
def append_to_file(file_path, content)
    # Like a bard adding verses to a song, we append the content to the file
    file = File.open(file_path, "a")
    file.write(content)
    file.close
end

# A method to display the contents of a file
def display_file(file_path)
    # Behold! We shall read the file and display its contents for all to see
    content = read_file(file_path)
    puts content
end

# A method to edit the contents of a file
def edit_file(file_path, new_content)
    # With the precision of a master scribe, we shall overwrite the file with new content
    write_file(file_path, new_content)
end

# A method to cache data in memory
def cache_data(data)
    # We shall store the data in a variable, like a treasure chest of knowledge
    @cache = data
end

# A method to retrieve cached data
def retrieve_cache
    # With a wave of our hand, we retrieve the data from the cache
    return @cache
end

# Main program execution begins here
# Let us declare the file path and some sample content
file_path = "example.txt"
sample_content = "To be, or not to be, that is the question."

# Write the sample content to the file
write_file(file_path, sample_content)

# Display the contents of the file
display_file(file_path)

# Append some more content to the file
append_to_file(file_path, "\nWhether 'tis nobler in the mind to suffer.")

# Display the updated contents of the file
display_file(file_path)

# Edit the file with new content
edit_file(file_path, "The slings and arrows of outrageous fortune.")

# Display the final contents of the file
display_file(file_path)

# Cache the final content in memory
cache_data(read_file(file_path))

# Retrieve and display the cached data
puts retrieve_cache

