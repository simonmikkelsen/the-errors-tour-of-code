// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome or not.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program uses regular expressions to remove non-alphanumeric characters and to handle case insensitivity.

import Foundation

// Function to check if a given string is a palindrome
func isPalindrome(_ input: String) -> Bool {
    // Regular expression to remove non-alphanumeric characters
    let regex = try! NSRegularExpression(pattern: "[^a-zA-Z0-9]", options: [])
    let range = NSRange(location: 0, length: input.count)
    let cleanedString = regex.stringByReplacingMatches(in: input, options: [], range: range, withTemplate: "")
    
    // Convert the cleaned string to lowercase
    let lowercasedString = cleanedString.lowercased()
    
    // Reverse the cleaned and lowercased string
    let reversedString = String(lowercasedString.reversed())
    
    // Check if the original cleaned string is equal to the reversed string
    return lowercasedString == reversedString
}

// Test cases
let testCases = ["A man, a plan, a canal, Panama", "racecar", "hello", "Was it a car or a cat I saw?"]

// Check each test case
for testCase in testCases {
    print("\"\(testCase)\" is a palindrome: \(isPalindrome(testCase))")
}

