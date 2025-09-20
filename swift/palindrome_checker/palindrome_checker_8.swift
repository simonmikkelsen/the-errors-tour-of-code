// Palindrome Checker Program
// This program checks if a given string is a palindrome. 
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The purpose of this program is to help programmers understand how to implement a palindrome checker in Swift.

import Foundation

// Function to check if a given string is a palindrome
func isPalindrome(_ str: String) -> Bool {
    // Remove all non-alphanumeric characters and convert to lowercase
    let cleanedString = str.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Initialize pointers for the start and end of the string
    var leftIndex = cleanedString.startIndex
    var rightIndex = cleanedString.index(before: cleanedString.endIndex)
    
    // Compare characters from the start and end of the string
    while leftIndex < rightIndex {
        if cleanedString[leftIndex] != cleanedString[rightIndex] {
            return false
        }
        leftIndex = cleanedString.index(after: leftIndex)
        rightIndex = cleanedString.index(before: rightIndex)
    }
    
    return true
}

// Main program execution
let testString: String
print("Enter a string to check if it is a palindrome:")
if let input = readLine() {
    testString = input
    if isPalindrome(testString) {
        print("\"\(testString)\" is a palindrome.")
    } else {
        print("\"\(testString)\" is not a palindrome.")
    }
} else {
    print("Invalid input.")
}

