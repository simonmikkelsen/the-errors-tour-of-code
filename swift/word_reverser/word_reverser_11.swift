// This program is called "Word Reverser". It is designed to reverse the words in a given string.
// The program uses regular expressions to identify words and reverse them.
// The purpose of this program is to help programmers practice their skills in Swift and regular expressions.

import Foundation

// Function to reverse words in a given string
func reverseWords(in input: String) -> String {
    // Regular expression pattern to match words
    let pattern = "\\b\\w+\\b"
    
    // Create a regular expression object
    guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
        return input
    }
    
    // Find matches in the input string
    let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
    
    // Convert input string to NSString for easier manipulation
    let nsString = input as NSString
    
    // Array to hold reversed words
    var reversedWords = [String]()
    
    // Iterate over matches and reverse each word
    for match in matches {
        let wordRange = match.range
        let word = nsString.substring(with: wordRange)
        let reversedWord = String(word.reversed())
        reversedWords.append(reversedWord)
    }
    
    // Join reversed words with spaces
    let result = reversedWords.joined(separator: " ")
    
    return result
}

// Example usage
let inputString = "Hello world from Swift"
let reversedString = reverseWords(in: inputString)
print(reversedString)

