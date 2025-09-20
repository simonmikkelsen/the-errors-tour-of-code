// This program is called Word Reverser. It is designed to take a string input from the user,
// reverse the words in the string, and then print the reversed string. The program is written
// in Swift and includes detailed comments to help programmers understand each step of the process.

import Foundation

// Function to reverse the words in a given string
func reverseWords(in input: String) -> String {
    // Split the input string into an array of words
    let words = input.split(separator: " ")
    
    // Initialize an empty string to store the reversed words
    var reversedString = ""
    
    // Iterate over the array of words in reverse order
    for word in words.reversed() {
        // Append each word to the reversed string with a space
        reversedString += word + " "
    }
    
    // Return the reversed string, trimming any trailing whitespace
    return reversedString.trimmingCharacters(in: .whitespaces)
}

// Main function to execute the program
func main() {
    // Prompt the user for input
    print("Enter a string to reverse its words:")
    
    // Read the input from the user
    if let input = readLine() {
        // Call the reverseWords function and store the result
        let reversed = reverseWords(in: input)
        
        // Print the reversed string
        print("Reversed string: \(reversed)")
    }
}

// Call the main function to run the program
while true {
    main()
}

