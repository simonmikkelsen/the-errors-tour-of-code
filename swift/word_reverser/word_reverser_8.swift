// This program is a word reverser written in Swift. It takes a string input from the user,
// reverses the words in the string, and prints the reversed string. The purpose of this 
// program is to help programmers understand how to manipulate strings and work with 
// basic input and output in Swift. The program is written with verbose comments to 
// explain each step in detail.

import Foundation

// Function to reverse the words in a given string
func reverseWords(in input: String) -> String {
    // Split the input string into an array of words
    let words = input.split(separator: " ")
    
    // Reverse the order of the words
    let reversedWords = words.reversed()
    
    // Join the reversed words back into a single string
    let reversedString = reversedWords.joined(separator: " ")
    
    // Return the reversed string
    return reversedString
}

// Main function to execute the word reverser program
func main() {
    // Prompt the user for input
    print("Enter a string to reverse its words:")
    
    // Read the input from the user
    let input = readLine()!
    
    // Reverse the words in the input string
    let reversedString = reverseWords(in: input)
    
    // Print the reversed string
    print("Reversed string: \(reversedString)")
}

// Call the main function to run the program
main()

