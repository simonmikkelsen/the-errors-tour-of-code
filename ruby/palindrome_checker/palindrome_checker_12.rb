# This program is a palindrome checker.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this program is to check if a given string is a palindrome.
# The program will remove non-alphanumeric characters and convert all letters to lowercase before checking for palindrome properties.

class PalindromeChecker
    def initialize
        @cache = {}
    end

    # This method checks if a given string is a palindrome.
    # It first normalizes the string by removing non-alphanumeric characters and converting it to lowercase.
    # Then it checks if the normalized string reads the same forward and backward.
    def palindrome?(string)
        normalized_string = normalize(string)
        return @cache[string] if @cache.key?(string)

        is_palindrome = normalized_string == normalized_string.reverse
        @cache[string] = is_palindrome
        is_palindrome
    end

    private

    # This method normalizes a string by removing non-alphanumeric characters and converting it to lowercase.
    def normalize(string)
        string.gsub(/[^0-9a-z]/i, '').downcase
    end
end

# Example usage:
checker = PalindromeChecker.new
puts checker.palindrome?("A man, a plan, a canal, Panama") # true
puts checker.palindrome?("Hello, World!") # false

