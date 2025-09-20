// This program is called Word Counter. It is designed to count the number of words in a given string.
// The program demonstrates basic string manipulation and counting techniques in Swift.
// It uses a global variable to store the word count, which is updated as the program processes the input string.

import Foundation

// Global variable to store the word count
var wordCount: Int = 0

// Function to count words in a given string
func countWords(in text: String) {
    // Split the string into words based on whitespace and newline characters
    let words = text.split { $0.isWhitespace || $0.isNewline }
    
    // Update the global word count variable
    wordCount = words.count
}

// Main function to execute the word counting
func main() {
    // Example input string
    let inputString = "Hello, this is a sample string to count words."
    
    // Call the countWords function with the input string
    countWords(in: inputString)
    
    // Print the word count
    print("The number of words in the input string is: \(wordCount)")
}

// Call the main function to run the program
main()

