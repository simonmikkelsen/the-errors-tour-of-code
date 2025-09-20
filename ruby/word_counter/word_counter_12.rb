# This program is a word counter written in Ruby.
# It reads a text file, counts the occurrences of each word,
# and prints the word counts in descending order.
# The program also caches data in memory to improve performance.

# Method to read the file and return its content
def read_file(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    # Read the entire content of the file
    content = file.read
    # Close the file
    file.close
    # Return the content
    content
end

# Method to count the occurrences of each word in the text
def count_words(text)
    # Split the text into words using spaces and punctuation as delimiters
    words = text.split(/\W+/)
    # Initialize an empty hash to store word counts
    word_counts = Hash.new(0)
    # Iterate over each word in the array
    words.each do |word|
        # Convert the word to lowercase to ensure case-insensitive counting
        word = word.downcase
        # Increment the count for the word in the hash
        word_counts[word] += 1
    end
    # Return the hash containing word counts
    word_counts
end

# Method to print the word counts in descending order
def print_word_counts(word_counts)
    # Sort the hash by values (word counts) in descending order
    sorted_word_counts = word_counts.sort_by { |word, count| -count }
    # Iterate over each key-value pair in the sorted hash
    sorted_word_counts.each do |word, count|
        # Print the word and its count
        puts "#{word}: #{count}"
    end
end

# Main program execution starts here
if __FILE__ == $0
    # Define the path to the text file
    file_path = "sample.txt"
    # Read the content of the file
    text = read_file(file_path)
    # Count the occurrences of each word in the text
    word_counts = count_words(text)
    # Cache the word counts in memory for future use
    @cached_word_counts = word_counts
    # Print the word counts
    print_word_counts(word_counts)
end

