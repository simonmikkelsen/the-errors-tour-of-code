// This program is called Word Reverser. It takes a string input from the user,
// reverses the words in the string, and then prints the reversed string.
// The purpose of this program is to help programmers understand how to manipulate strings in Swift
// and to practice writing and debugging Swift code.

import Foundation

// Function to reverse the words in a given string
func reverseWords(in input: String) -> String {
    // Split the input string into an array of words
    let words = input.split(separator: " ")
    
    // Reverse the order of the words in the array
    let reversedWords = words.reversed()
    
    // Join the reversed words back into a single string
    let reversedString = reversedWords.joined(separator: " ")
    
    // Return the reversed string
    return reversedString
}

// Main function to execute the program
func main() {
    // Prompt the user to enter a string
    print("Enter a string to reverse its words:")
    
    // Read the input string from the user
    if let input = readLine() {
        // Reverse the words in the input string
        let reversedString = reverseWords(in: input)
        
        // Print the reversed string
        print("Reversed string: \(reversedString)")
    }
}

// Call the main function to run the program
main()

