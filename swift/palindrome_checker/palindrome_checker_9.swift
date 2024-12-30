// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

import Foundation

// Function to check if a string is a palindrome
func isPalindrome(_ str: String) -> Bool {
    // Remove all non-alphanumeric characters and convert to lowercase
    let cleanedString = str.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Compare the cleaned string with its reverse
    let reversedString = String(cleanedString.reversed())
    
    // Return true if the cleaned string is equal to its reverse
    return cleanedString == reversedString
}

// Main function to execute the palindrome check
func main() {
    // Prompt the user for input
    print("Enter a string to check if it is a palindrome:")
    
    // Read the user input
    if let input = readLine() {
        // Check if the input string is a palindrome
        let result = isPalindrome(input)
        
        // Print the result
        if result {
            print("The string is a palindrome.")
        } else {
            print("The string is not a palindrome.")
        }
    } else {
        // Handle the case where input is nil
        print("Invalid input.")
    }
}

// Call the main function to run the program
main()

