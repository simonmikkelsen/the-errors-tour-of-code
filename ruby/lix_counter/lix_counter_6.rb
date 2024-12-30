# This program is called Lix Counter.
# It is designed to calculate the Lix readability index of a given text.
# The Lix readability index is a measure of how difficult a text is to read.
# The formula for Lix is: Lix = (A / B) + (C * 100 / A)
# Where:
# A = Number of words
# B = Number of sentences
# C = Number of long words (more than 6 letters)

def lix_counter(text)
    # Split the text into words
    words = text.split

    # Count the number of words
    num_words = words.length

    # Split the text into sentences
    sentences = text.split(/[.!?]/)

    # Count the number of sentences
    num_sentences = sentences.length

    # Count the number of long words
    num_long_words = words.count { |word| word.length > 6 }

    # Calculate the Lix readability index
    lix = (num_words / num_sentences) + (num_long_words * 100 / num_words)

    # Return the Lix readability index
    lix
end

# Example usage of the lix_counter method
text = "This is an example text. It contains several sentences. Some of the words are quite long, such as 'example' and 'contains'."
puts "The Lix readability index of the text is: #{lix_counter(text)}"

