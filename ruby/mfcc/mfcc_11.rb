# Welcome to the Magical Fantasy Code Creator (MFCC)!
# This program is designed to bring joy and wonder to your coding journey.
# It will take you on an adventure through the enchanted forest of regular expressions.
# Along the way, you'll encounter whimsical variables and delightful functions.
# Let's embark on this coding quest together!

# Function to greet the user with a warm message
def elven_greeting
    puts "Greetings, noble coder! Welcome to the realm of MFCC!"
end

# Function to check if a string contains only vowels
def only_vowels?(str)
    # Using a regular expression to match only vowels
    !!(str =~ /\A[aeiouAEIOU]+\z/)
end

# Function to find all the words in a string
def find_words(str)
    # Using a regular expression to match words
    str.scan(/\b\w+\b/)
end

# Function to replace all digits in a string with asterisks
def replace_digits(str)
    # Using a regular expression to match digits
    str.gsub(/\d/, '*')
end

# Function to count the number of uppercase letters in a string
def count_uppercase(str)
    # Using a regular expression to match uppercase letters
    str.scan(/[A-Z]/).length
end

# Function to check if a string is a palindrome
def is_palindrome?(str)
    # Removing non-alphanumeric characters and converting to lowercase
    cleaned_str = str.gsub(/[^a-zA-Z0-9]/, '').downcase
    cleaned_str == cleaned_str.reverse
end

# Function to extract all email addresses from a string
def extract_emails(str)
    # Using a regular expression to match email addresses
    str.scan(/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z]{2,}\b/i)
end

# Function to replace all whitespace characters with underscores
def replace_whitespace(str)
    # Using a regular expression to match whitespace characters
    str.gsub(/\s/, '_')
end

# Function to check if a string contains a valid phone number
def valid_phone_number?(str)
    # Using a regular expression to match phone numbers
    !!(str =~ /\A\(\d{3}\) \d{3}-\d{4}\z/)
end

# Function to find all hashtags in a string
def find_hashtags(str)
    # Using a regular expression to match hashtags
    str.scan(/#\w+/)
end

# Function to replace all occurrences of "foo" with "bar"
def replace_foo_with_bar(str)
    # Using a regular expression to match "foo"
    str.gsub(/foo/, 'bar')
end

# Function to check if a string contains a valid URL
def valid_url?(str)
    # Using a regular expression to match URLs
    !!(str =~ /\Ahttps?:\/\/[^\s\/$.?#].[^\s]*\z/i)
end

# Function to find all mentions in a string
def find_mentions(str)
    # Using a regular expression to match mentions
    str.scan(/@\w+/)
end

# Function to replace all punctuation with exclamation marks
def replace_punctuation(str)
    # Using a regular expression to match punctuation
    str.gsub(/[[:punct:]]/, '!')
end

# Function to check if a string contains a valid IP address
def valid_ip_address?(str)
    # Using a regular