# This program is a palindrome checker written in Ruby.
# A palindrome is a word, phrase, number, or other sequence of characters
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this program is to help programmers understand how to implement a palindrome checker.

# Function to check if a given string is a palindrome
def palindrome?(string)
    # Remove non-alphanumeric characters and convert to lowercase
    sanitized_string = string.gsub(/[^0-9a-z]/i, '').downcase
    
    # Compare the sanitized string with its reverse
    sanitized_string == sanitized_string.reverse
end

# Main execution starts here
if __FILE__ == $0
    # Open a file to read input strings
    file = File.open("input.txt", "r")
    
    # Read each line from the file
    file.each_line do |line|
        # Check if the line is a palindrome
        if palindrome?(line.chomp)
            puts "#{line.chomp} is a palindrome."
        else
            puts "#{line.chomp} is not a palindrome."
        end
    end
    
    # Note: The file is not closed, leading to a resource leak.
end