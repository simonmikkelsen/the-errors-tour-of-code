// WordCounter.swift
// This program is designed to count the number of words in a given string.
// It takes a string input from the user and outputs the total word count.
// The program demonstrates basic string manipulation and counting techniques in Swift.

import Foundation

// Function to count words in a given string
func countWords(in input: String) -> Int {
    // Split the input string into components separated by spaces
    let words = input.components(separatedBy: " ")
    // Return the count of words
    return words.count
}

// Main program execution starts here
print("Enter a string to count the number of words:")
if let userInput = readLine() {
    // Call the countWords function and store the result
    let wordCount = countWords(in: userInput)
    // Print the total word count
    print("Total number of words: \(wordCount)")
}

