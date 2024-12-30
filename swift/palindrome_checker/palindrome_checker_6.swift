// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

import Foundation

// Function to check if a given string is a palindrome
func isPalindrome(_ input: String) -> Bool {
    // Remove all non-alphanumeric characters and convert to lowercase
    let cleanedInput = input.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Compare the cleaned input with its reverse
    return cleanedInput == String(cleanedInput.reversed())
}

// Main function to execute the palindrome check
func main() {
    // Prompt the user for input
    print("Enter a string to check if it is a palindrome:")
    
    // Read the user input
    if let userInput = readLine() {
        // Check if the input is a palindrome
        if isPalindrome(userInput) {
            print("The string is a palindrome.")
        } else {
            print("The string is not a palindrome.")
        }
    }
}

// Call the main function to run the program
main()

