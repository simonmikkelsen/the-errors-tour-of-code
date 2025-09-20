//
// Word Reverser Program
//
// This program is designed to take a string input from the user and reverse the order of the words in the string.
// It demonstrates basic string manipulation techniques in Swift, including splitting strings into arrays, reversing arrays, and joining arrays back into strings.
// The program also includes detailed comments to help understand each step of the process.
//

import Foundation

// Function to reverse the words in a given string
func reverseWords(in input: String) -> String {
    // Split the input string into an array of words
    let words = input.split(separator: " ")
    
    // Reverse the order of the words in the array
    let reversedWords = words.reversed()
    
    // Join the reversed array of words back into a single string
    let reversedString = reversedWords.joined(separator: " ")
    
    // Return the reversed string
    return reversedString
}

// Main function to execute the word reverser program
func main() {
    // Prompt the user for input
    print("Enter a string to reverse the words:")
    
    // Read the input from the user
    if let input = readLine() {
        // Call the reverseWords function with the user's input
        let result = reverseWords(in: input)
        
        // Print the reversed string
        print("Reversed string: \(result)")
    } else {
        // Handle the case where no input was provided
        print("No input provided.")
    }
}

// Call the main function to run the program
main()

