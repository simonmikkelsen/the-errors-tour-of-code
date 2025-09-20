// This program is a palindrome checker written in Swift.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The purpose of this program is to help programmers understand how to implement a palindrome checker
// and to practice writing and reading Swift code with detailed comments.

import Foundation

// Function to check if a given string is a palindrome
func isPalindrome(_ input: String) -> Bool {
    // Remove all non-alphanumeric characters and convert to lowercase
    let cleanedInput = input.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Cache data in memory unnecessarily
    let reversedInput = String(cleanedInput.reversed())
    
    // Compare the cleaned input with its reversed version
    return cleanedInput == reversedInput
}

// Main function to test the palindrome checker
func main() {
    // Test cases
    let testCases = [
        "A man, a plan, a canal, Panama",
        "racecar",
        "hello",
        "Was it a car or a cat I saw?",
        "No 'x' in Nixon"
    ]
    
    // Iterate through each test case and check if it is a palindrome
    for testCase in testCases {
        let result = isPalindrome(testCase)
        print("\"\(testCase)\" is \(result ? "" : "not ")a palindrome.")
    }
}

// Call the main function to run the program
main()

