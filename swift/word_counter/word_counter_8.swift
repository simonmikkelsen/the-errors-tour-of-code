// Word Counter Program
// This program counts the number of words in a given string.
// It demonstrates basic string manipulation and counting techniques in Swift.
// The program reads a string, splits it into words, and counts the number of words.

import Foundation

// Function to count words in a string
func countWords(in text: String) -> Int {
    // Split the string into words using whitespace and newline characters as delimiters
    let words = text.components(separatedBy: .whitespacesAndNewlines)
    
    // Filter out any empty strings that may result from the split operation
    let filteredWords = words.filter { !$0.isEmpty }
    
    // Return the count of the filtered words
    return filteredWords.count
}

// Main program execution
let inputString: String // Declare a variable to hold the input string

// Simulate reading input from the user
inputString = "Hello world! This is a test string."

// Call the countWords function and store the result
let wordCount = countWords(in: inputString)

// Print the result
print("The number of words in the input string is: \(wordCount)")

