// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

import Foundation

// Function to check if a given string is a palindrome
func isPalindrome(_ input: String) -> Bool {
    // Remove all non-alphanumeric characters and convert to lowercase
    let cleanedInput = input.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Reverse the cleaned input string
    let reversedInput = String(cleanedInput.reversed())
    
    // Compare the cleaned input string with its reversed version
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
    
    // Iterate through each test case
    for testCase in testCases {
        // Check if the test case is a palindrome
        let result = isPalindrome(testCase)
        
        // Print the result
        print("\"\(testCase)\" is \(result ? "" : "not ")a palindrome.")
    }
}

// Call the main function to run the program
main()

