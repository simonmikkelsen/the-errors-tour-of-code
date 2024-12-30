// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take input from the user, process the string, and determine if it is a palindrome.

import Foundation

// Function to check if a string is a palindrome
func isPalindrome(_ str: String) -> Bool {
    // Remove spaces and punctuation, and convert to lowercase
    let cleanedString = str.lowercased().filter { $0.isLetter }
    
    // Compare the cleaned string with its reverse
    return cleanedString == String(cleanedString.reversed())
}

// Main function to execute the palindrome checker
func main() {
    // Create a file handle for standard input
    let fileHandle = FileHandle.standardInput
    
    // Prompt the user for input
    print("Enter a string to check if it is a palindrome:")
    
    // Read the input from the user
    if let inputData = try? fileHandle.readToEnd(), 
       let inputString = String(data: inputData, encoding: .utf8) {
        
        // Trim any trailing newline characters from the input
        let trimmedString = inputString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if the input string is a palindrome
        if isPalindrome(trimmedString) {
            print("The string is a palindrome.")
        } else {
            print("The string is not a palindrome.")
        }
    } else {
        print("Failed to read input.")
    }
}

// Call the main function to run the program
main()

