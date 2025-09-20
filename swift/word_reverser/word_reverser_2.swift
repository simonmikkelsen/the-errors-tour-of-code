// This program is called Word Reverser. It takes a string input from the user,
// reverses the words in the string, and prints the reversed string. The purpose
// of this program is to help programmers understand how to manipulate strings
// and work with user input in Swift. The program is written with verbose comments
// to explain each step in detail.

import Foundation

// Function to reverse the words in a given string
func reverseWords(in input: String) -> String {
    // Split the input string into an array of words
    let words = input.split(separator: " ")
    
    // Reverse the array of words
    let reversedWords = words.reversed()
    
    // Join the reversed array of words back into a single string
    let reversedString = reversedWords.joined(separator: " ")
    
    // Return the reversed string
    return reversedString
}

// Main function to execute the program
func main() {
    // Prompt the user for input
    print("Enter a string to reverse its words:")
    
    // Read the user input from the standard input
    if let input = readLine() {
        // Call the reverseWords function to reverse the words in the input string
        let reversedString = reverseWords(in: input)
        
        // Print the reversed string
        print("Reversed string: \(reversedString)")
    }
}

// Call the main function to start the program
main()

