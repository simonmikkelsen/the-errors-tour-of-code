# Welcome, dear programmer, to this delightful Ruby script!
# This program is a whimsical journey through the land of text processing.
# It uses the magic of regular expressions to transform and analyze strings.
# Along the way, you'll encounter many charming variables and functions.
# Enjoy the vibrant and verbose comments that guide you through this enchanted code.

# Function to count the number of vowels in a string
def count_vowels(str)
    # The vowels are like the beautiful colors of a rainbow
    vowels = str.scan(/[aeiouAEIOU]/)
    return vowels.length
end

# Function to replace all digits in a string with asterisks
def replace_digits(str)
    # Digits are like little stars in the night sky
    stars = str.gsub(/\d/, '*')
    return stars
end

# Function to check if a string contains a specific pattern
def contains_pattern(str, pattern)
    # Patterns are like hidden treasures waiting to be found
    treasure = str.match?(pattern)
    return treasure
end

# Function to reverse the words in a string
def reverse_words(str)
    # Words are like little elves dancing in reverse
    elves = str.split(/\s+/).reverse.join(' ')
    return elves
end

# Function to count the number of words in a string
def count_words(str)
    # Words are like precious gems, each one unique and valuable
    gems = str.split(/\s+/)
    return gems.length
end

# Function to extract all email addresses from a string
def extract_emails(str)
    # Emails are like secret messages from faraway lands
    messages = str.scan(/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/)
    return messages
end

# Function to replace all whitespace with underscores
def replace_whitespace(str)
    # Whitespace is like the gentle breeze, now turned into solid ground
    solid_ground = str.gsub(/\s+/, '_')
    return solid_ground
end

# Function to check if a string is a palindrome
def is_palindrome(str)
    # Palindromes are like magical mirrors reflecting the same image
    mirror = str.downcase.gsub(/\W/, '')
    return mirror == mirror.reverse
end

# Function to extract all hashtags from a string
def extract_hashtags(str)
    # Hashtags are like little flags waving in the wind
    flags = str.scan(/#\w+/)
    return flags
end

# Function to replace all vowels with a specific character
def replace_vowels(str, char)
    # Vowels are like delicate flowers, now transformed into something new
    flowers = str.gsub(/[aeiouAEIOU]/, char)
    return flowers
end

# Function to count the number of consonants in a string
def count_consonants(str)
    # Consonants are like sturdy trees in a forest
    trees = str.scan(/[^aeiouAEIOU\s\d\W]/)
    return trees.length
end

# Function to check if a string contains only alphabetic characters
def is_alpha(str)
    # Alphabetic characters are like the letters in a love letter
    love_letter = str.match?(/\A[a-zA-Z]+\z/)
    return love_letter
end

# Function to extract all URLs from a string
def extract_urls(str)
    # URLs are like pathways to distant lands
    pathways = str.scan(/\bhttps?:\/\/\S+\b/)
    return pathways
end

# Function to replace all punctuation with spaces
def replace_punctuation(str)
    # Punctuation is like the spices in a dish, now replaced with simplicity