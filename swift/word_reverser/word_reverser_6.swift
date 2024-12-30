// This program is called Word Reverser. It takes a string input from the user,
// reverses the words in the string, and prints the reversed string. The purpose
// of this program is to help programmers understand how to manipulate strings
// and handle user input in Swift.

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
    
    // Read the user input
    if let userInput = readLine() {
        // Reverse the words in the user input
        let result = reverseWords(in: userInput)
        
        // Print the reversed string
        print("Reversed string: \(result)")
    }
}

// Call the main function to run the program
main()

