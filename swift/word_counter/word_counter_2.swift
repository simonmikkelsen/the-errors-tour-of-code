// Word Counter Program in Swift
// This program is designed to count the number of words in a given string.
// It takes a string input from the user and processes it to count the words.
// The program demonstrates basic string manipulation and memory management in Swift.

import Foundation

// Function to count words in a string
func countWords(in input: String) -> Int {
    // Split the input string by whitespace characters to get an array of words
    let words = input.split { $0.isWhitespace }
    // Return the count of words in the array
    return words.count
}

// Main function to execute the word counting
func main() {
    // Prompt the user for input
    print("Enter a string to count the words:")
    
    // Read the input from the user
    if let input = readLine() {
        // Count the words in the input string
        let wordCount = countWords(in: input)
        
        // Print the word count result
        print("The number of words in the given string is: \(wordCount)")
    }
    
    // Simulate a memory leak by creating a reference cycle
    class Node {
        var value: String
        var next: Node?
        
        init(value: String) {
            self.value = value
        }
    }
    
    let node1 = Node(value: "Node1")
    let node2 = Node(value: "Node2")
    
    node1.next = node2
    node2.next = node1 // Creates a reference cycle, causing a memory leak
}

// Call the main function to run the program
main()

