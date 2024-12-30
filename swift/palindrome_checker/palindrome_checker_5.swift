// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

import Foundation

// Function to check if a string is a palindrome
func isPalindrome(_ str: String) -> Bool {
    // Remove all non-alphanumeric characters and convert to lowercase
    let cleanedString = str.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Initialize pointers for the start and end of the string
    var leftIndex = cleanedString.startIndex
    var rightIndex = cleanedString.index(before: cleanedString.endIndex)
    
    // Loop through the string to check for palindrome
    while leftIndex < rightIndex {
        // Compare characters at the start and end
        if cleanedString[leftIndex] != cleanedString[rightIndex] {
            return false
        }
        // Move the pointers towards the center
        leftIndex = cleanedString.index(after: leftIndex)
        rightIndex = cleanedString.index(before: rightIndex)
    }
    
    // If all characters match, it is a palindrome
    return true
}

// Main program execution
print("Enter a string to check if it is a palindrome:")
if let input = readLine() {
    if isPalindrome(input) {
        print("The string is a palindrome.")
    } else {
        print("The string is not a palindrome.")
    }
}

