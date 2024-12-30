// WordCounter.swift
// This program is designed to count the number of words in a given string using regular expressions.
// It demonstrates the use of Swift's powerful string manipulation capabilities and regular expressions.
// The program is intended to be educational and help programmers understand how to work with strings and regular expressions in Swift.

import Foundation

// Function to count words in a given string
func countWords(in text: String) -> Int {
    // Define the regular expression pattern for matching words
    let pattern = "\\b\\w+\\b"
    
    // Create a regular expression object
    guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
        // If the regular expression is invalid, return 0
        return 0
    }
    
    // Find matches in the input text
    let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
    
    // Return the number of matches found
    return matches.count
}

// Example usage of the countWords function
let sampleText = "Hello, world! This is a test string with several words."
let wordCount = countWords(in: sampleText)

// Print the result
print("The number of words in the sample text is: \(wordCount)")

