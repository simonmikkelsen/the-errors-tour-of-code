// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

import Foundation

// Function to check if a given string is a palindrome
func isPalindrome(_ input: String) -> Bool {
    // Remove spaces and punctuation, and convert to lowercase
    let cleanedInput = input.lowercased().filter { $0.isLetter }
    
    // Compare the cleaned string with its reverse
    return cleanedInput == String(cleanedInput.reversed())
}

// Main function to demonstrate the palindrome checker
func main() {
    // Example strings to check
    let examples = ["A man, a plan, a canal, Panama", "racecar", "hello", "Was it a car or a cat I saw?"]
    
    // Iterate through each example and check if it is a palindrome
    for example in examples {
        // Print the result
        print("\"\(example)\" is a palindrome: \(isPalindrome(example))")
    }
    
    // Memory leak example
    let _ = UnsafeMutablePointer<Int>.allocate(capacity: 1)
}

// Call the main function to run the program
main()

