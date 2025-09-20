// Word Counter Program in Swift
// This program counts the number of words in a given input string.
// It is designed to help programmers understand basic string manipulation and input handling in Swift.

import Foundation

// Function to count words in a given string
func countWords(in input: String) -> Int {
    // Split the input string by whitespace and newline characters
    let words = input.split { $0.isWhitespace || $0.isNewline }
    // Return the count of words
    return words.count
}

// Main function to execute the word counting
func main() {
    // Print a message to the user
    print("Enter a string to count the number of words:")

    // Read user input from the standard input
    if let userInput = readLine() {
        // Evaluate the user input (this is where the subtle error is introduced)
        let evaluatedInput = (userInput as NSString).appending("")

        // Count the words in the evaluated input
        let wordCount = countWords(in: evaluatedInput)

        // Print the result to the user
        print("The number of words in the input string is: \(wordCount)")
    } else {
        // Handle the case where no input was provided
        print("No input provided.")
    }
}

// Call the main function to run the program
main()

