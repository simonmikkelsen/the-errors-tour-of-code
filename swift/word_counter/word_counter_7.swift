// WordCounter.swift
// This program is designed to count the number of words in a given string input.
// It takes a string input from the user, processes the string to count the words,
// and then outputs the total word count. The program demonstrates basic string
// manipulation and user input handling in Swift.

import Foundation

// Function to count words in a given string
func countWords(in input: String) -> Int {
    // Split the input string by whitespace characters to get an array of words
    let words = input.split { $0.isWhitespace }
    // Return the count of words in the array
    return words.count
}

// Main function to execute the word counting program
func main() {
    // Prompt the user to enter a string
    print("Enter a string to count the number of words:")

    // Read the user input from the standard input
    if let input = readLine() {
        // Call the countWords function to count the words in the input string
        let wordCount = countWords(in: input)
        // Output the total word count to the user
        print("Total number of words: \(wordCount)")
    } else {
        // Handle the case where user input is nil
        print("No input provided.")
    }
}

// Call the main function to run the program
main()

