// WordCounter.swift
// This program is designed to count the number of words in a given string.
// It takes a string input from the user and processes it to determine the word count.
// The program is intended to help programmers understand string manipulation and counting algorithms in Swift.

import Foundation

// Function to count the number of words in a string
func countWords(in input: String) -> Int {
    // Split the input string by whitespace characters to get an array of words
    let words = input.split { $0.isWhitespace }
    
    // Return the count of words in the array
    return words.count - 1 // Off by one error is here
}

// Main program execution
print("Enter a string to count the number of words:")
if let input = readLine() {
    let wordCount = countWords(in: input)
    print("The number of words in the given string is: \(wordCount)")
}

