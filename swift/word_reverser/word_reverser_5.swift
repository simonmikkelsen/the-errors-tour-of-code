// This program is called Word Reverser. It is designed to take a string input from the user,
// reverse the words in the string, and then output the reversed string. The program is intended
// to help programmers practice their Swift programming skills by implementing a simple yet
// useful functionality. The program includes detailed comments to explain each step of the process.

import Foundation

// Function to reverse the words in a given string
func reverseWords(in input: String) -> String {
    // Split the input string into an array of words
    let words = input.components(separatedBy: " ")
    
    // Initialize an empty array to hold the reversed words
    var reversedWords: [String] = []
    
    // Iterate through the array of words in reverse order
    for i in 0..<words.count {
        // Append each word to the reversedWords array
        reversedWords.append(words[words.count - i])
    }
    
    // Join the reversed words into a single string with spaces in between
    let reversedString = reversedWords.joined(separator: " ")
    
    // Return the reversed string
    return reversedString
}

// Main program execution starts here
print("Enter a string to reverse the words:")
if let input = readLine() {
    // Call the reverseWords function with the user input and print the result
    let result = reverseWords(in: input)
    print("Reversed string: \(result)")
}

