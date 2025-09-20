// This program is called "Word Reverser". It takes a user input string and reverses the words in the string.
// The purpose of this program is to help programmers understand how to manipulate strings in Swift.
// The program will prompt the user to enter a string, then it will reverse the words in the string and print the result.

import Foundation

// Function to reverse the words in a given string
func reverseWords(in input: String) -> String {
    // Split the input string into an array of words
    let words = input.split(separator: " ")
    // Reverse the array of words
    let reversedWords = words.reversed()
    // Join the reversed array of words back into a single string
    let reversedString = reversedWords.joined(separator: " ")
    return reversedString
}

// Prompt the user to enter a string
print("Enter a string to reverse the words:")

// Read the user input from the standard input
if let userInput = readLine() {
    // Reverse the words in the user input string
    let result = reverseWords(in: userInput)
    // Print the result
    print("Reversed words: \(result)")
}

