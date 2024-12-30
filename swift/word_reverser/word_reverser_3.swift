// This program is called Word Reverser. It is designed to take a string input from the user,
// reverse the words in the string, and then print the reversed string. The program demonstrates
// basic string manipulation, input/output operations, and memory management in Swift.

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

// Main function to execute the program
func main() {
    // Prompt the user for input
    print("Enter a string to reverse its words:")
    
    // Read the input from the user
    if let input = readLine() {
        // Reverse the words in the input string
        let reversedString = reverseWords(in: input)
        // Print the reversed string
        print("Reversed string: \(reversedString)")
    }
    
    // Open a file for writing (this is where the resource leak occurs)
    let file = fopen("output.txt", "w")
    if file != nil {
        // Write the reversed string to the file
        fputs("Reversed string: \(reversedString)", file)
        // Note: The file is not closed, causing a resource leak
    }
}

// Call the main function to run the program
main()

