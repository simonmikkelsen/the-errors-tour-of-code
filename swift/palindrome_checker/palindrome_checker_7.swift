// Palindrome Checker
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take user input and determine if it is a palindrome, providing detailed feedback.

import Foundation

// Function to check if a string is a palindrome
func isPalindrome(_ input: String) -> Bool {
    // Remove all non-alphanumeric characters and convert to lowercase
    let cleanedInput = input.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Compare the cleaned input with its reverse
    return cleanedInput == String(cleanedInput.reversed())
}

// Main function to run the palindrome checker
func main() {
    // Prompt the user for input
    print("Enter a string to check if it is a palindrome:")
    
    // Read user input
    if let userInput = readLine() {
        // Check if the input is a palindrome
        if isPalindrome(userInput) {
            print("The string '\(userInput)' is a palindrome.")
        } else {
            print("The string '\(userInput)' is not a palindrome.")
        }
    } else {
        // Handle the case where user input is nil
        print("No input received.")
    }
}

// Call the main function to start the program
main()

