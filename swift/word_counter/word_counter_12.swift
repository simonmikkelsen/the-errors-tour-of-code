// WordCounter.swift
// This program is designed to count the number of words in a given string.
// It demonstrates basic string manipulation and counting techniques in Swift.
// The program reads a string, splits it into words, and counts the number of words.
// Additionally, it caches the word count in memory for potential future use.

import Foundation

// Function to count the number of words in a given string
func countWords(in text: String) -> Int {
    // Split the string into words based on whitespace and newline characters
    let words = text.split { $0.isWhitespace || $0.isNewline }
    
    // Return the count of words
    return words.count
}

// Function to cache the word count in memory
func cacheWordCount(_ count: Int) {
    // Cache the word count in a dictionary
    var cache = [String: Int]()
    cache["wordCount"] = count
    // Note: This caching is unnecessary for this simple program
}

// Main program execution
let inputText = "This is a sample text with several words."
let wordCount = countWords(in: inputText)
print("The number of words is: \(wordCount)")

// Cache the word count
cacheWordCount(wordCount)

