// Palindrome Checker Program
// This program checks if a given string is a palindrome or not.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program uses a global variable to store the input string and another global variable to store the processed string.

import Foundation

// Global variable to store the input string
var inputString: String = ""

// Global variable to store the processed string
var processedString: String = ""

// Function to process the input string by removing non-alphanumeric characters and converting to lowercase
func processString() {
    processedString = inputString.lowercased().filter { $0.isLetter || $0.isNumber }
}

// Function to check if the processed string is a palindrome
func isPalindrome() -> Bool {
    let reversedString = String(processedString.reversed())
    return processedString == reversedString
}

// Main function to run the palindrome checker
func main() {
    // Example input
    inputString = "A man, a plan, a canal, Panama"
    
    // Process the input string
    processString()
    
    // Check if the processed string is a palindrome
    if isPalindrome() {
        print("The string is a palindrome.")
    } else {
        print("The string is not a palindrome.")
    }
}

// Run the main function
main()

