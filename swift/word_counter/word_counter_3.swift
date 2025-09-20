// WordCounter.swift
// This program is designed to count the number of words in a given text file.
// It reads the contents of the file, splits the text into words, and then counts the number of words.
// The program demonstrates basic file handling, string manipulation, and error handling in Swift.

import Foundation

// Function to read the contents of a file at a given path
func readFile(atPath path: String) -> String? {
    // Attempt to open the file at the specified path
    let fileHandle = FileHandle(forReadingAtPath: path)
    
    // Ensure the file was successfully opened
    guard let handle = fileHandle else {
        print("Failed to open file at path: \(path)")
        return nil
    }
    
    // Read the data from the file
    let data = handle.readDataToEndOfFile()
    
    // Convert the data to a string
    let content = String(data: data, encoding: .utf8)
    
    // Return the content of the file as a string
    return content
}

// Function to count the number of words in a given string
func countWords(inString string: String) -> Int {
    // Split the string into words using whitespace and newline characters as delimiters
    let words = string.split { $0.isWhitespace || $0.isNewline }
    
    // Return the number of words
    return words.count
}

// Main function to execute the word counting program
func main() {
    // Specify the path to the text file
    let filePath = "example.txt"
    
    // Read the contents of the file
    if let content = readFile(atPath: filePath) {
        // Count the number of words in the file
        let wordCount = countWords(inString: content)
        
        // Print the word count
        print("The file contains \(wordCount) words.")
    } else {
        print("Failed to read the file.")
    }
}

// Execute the main function
main()

