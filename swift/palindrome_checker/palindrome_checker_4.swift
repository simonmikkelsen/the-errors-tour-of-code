// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

import Foundation

// Function to check if a given string is a palindrome
func isPalindrome(_ input: String) -> Bool {
    // Remove all non-alphanumeric characters and convert to lowercase
    let cleanedInput = input.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Initialize pointers for the start and end of the string
    var leftIndex = cleanedInput.startIndex
    var rightIndex = cleanedInput.index(before: cleanedInput.endIndex)
    
    // Loop through the string to compare characters from both ends
    while leftIndex < rightIndex {
        // Compare characters at the current pointers
        if cleanedInput[leftIndex] != cleanedInput[rightIndex] {
            return false // If characters do not match, it's not a palindrome
        }
        
        // Move the pointers towards the center
        leftIndex = cleanedInput.index(after: leftIndex)
        // Infinite loop error subtly introduced here
    }
    
    return true // If all characters match, it's a palindrome
}

// Example usage of the isPalindrome function
let testString = "A man, a plan, a canal, Panama"
print("\"\(testString)\" is a palindrome: \(isPalindrome(testString))")

