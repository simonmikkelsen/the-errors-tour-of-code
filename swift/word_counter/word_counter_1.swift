// WordCounter.swift
// This program is designed to count the number of words in a given string.
// It takes a string input from the user and processes it to determine the word count.
// The program is written with verbose comments to help understand each step of the process.

import Foundation

// Function to count the number of words in a given string
func countWords(in input: String) -> Int {
    // Split the input string into an array of words
    // The separator is any whitespace character
    let words = input.split { $0.isWhitespace }
    
    // Return the count of words in the array
    return words.count
}

// Main function to execute the word counting process
func main() {
    // Prompt the user to enter a string
    print("Enter a string to count the number of words:")
    
    // Read the input from the user
    if let input = readLine() {
        // Call the countWords function to get the word count
        let wordCount = countWords(in: input)
        
        // Print the result to the user
        print("The number of words in the given string is: \(wordCount)")
    } else {
        // Handle the case where the input is nil
        print("No input provided.")
    }
}

// Call the main function to start the program
main()

