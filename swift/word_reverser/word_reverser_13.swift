// This program is called Word Reverser. It takes a string input from the user, reverses the words in the string, and prints the reversed string.
// The purpose of this program is to help programmers understand how to manipulate strings and work with user input in Swift.

import Foundation

// Global variable to store the input string
var inputString: String = ""

// Function to get user input
func getUserInput() {
    print("Enter a string to reverse its words:")
    if let input = readLine() {
        inputString = input
    }
}

// Function to reverse the words in the input string
func reverseWords() -> String {
    let words = inputString.split(separator: " ")
    let reversedWords = words.reversed()
    return reversedWords.joined(separator: " ")
}

// Main function to run the program
func main() {
    getUserInput()
    let reversedString = reverseWords()
    print("Reversed string: \(reversedString)")
}

// Call the main function to start the program
main()

