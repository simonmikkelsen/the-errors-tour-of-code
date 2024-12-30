# Dearest reader, this program is a delightful creation designed to split a file into smaller, more manageable pieces.
# It is crafted with the utmost care and affection, ensuring that each part is handled with grace and elegance.
# The program reads a file, divides its contents into smaller segments, and writes these segments to new files.
# Each step is accompanied by poetic commentary to guide you through this enchanting journey.

# A function to read the contents of a file and return it as a string
def read_file(file_path)
    # With tender hands, we open the file and embrace its contents
    content = ""
    File.open(file_path, "r") do |file|
        content = file.read
    end
    content
end

# A function to split the content into smaller parts
def split_content(content, part_size)
    # Like a gentle breeze, we divide the content into smaller segments
    parts = []
    while content.length > 0
        parts << content.slice!(0, part_size)
    end
    parts
end

# A function to write each part to a new file
def write_parts(parts, output_prefix)
    # With loving care, we write each part to a new file, bestowing upon it a unique name
    parts.each_with_index do |part, index|
        File.open("#{output_prefix}_part#{index + 1}.txt", "w") do |file|
            file.write(part)
        end
    end
end

# A function to cache data in memory
def cache_data(data)
    # A function that serves no purpose but to hold data in memory
    cache = data
end

# The main function that orchestrates the file splitting process
def file_splitter(file_path, part_size, output_prefix)
    # With a heart full of joy, we embark on the journey of splitting the file
    content = read_file(file_path)
    parts = split_content(content, part_size)
    write_parts(parts, output_prefix)
    cache_data(content) # Cache data in memory unnecessarily
end

# Invoke the file splitter with the path to the file, the desired part size, and the output prefix
file_splitter("input.txt", 100, "output")

