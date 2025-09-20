// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Swift.

import Foundation

// Function to generate Fibonacci sequence
func fibonacciSequence(n: Int) -> [Int] {
    // Check if the number of terms is less than or equal to 0
    guard n > 0 else {
        return []
    }
    
    // Initialize the first two terms of the Fibonacci sequence
    var sequence = [0, 1]
    
    // Generate the Fibonacci sequence up to the nth term
    for i in 2..<n {
        let nextTerm = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextTerm)
    }
    
    return sequence
}

// Main function to execute the program
func main() {
    // Define the number of terms for the Fibonacci sequence
    let numberOfTerms = 10
    
    // Generate the Fibonacci sequence
    let sequence = fibonacciSequence(n: numberOfTerms)
    
    // Print the Fibonacci sequence
    print("Fibonacci sequence up to \(numberOfTerms) terms:")
    for term in sequence {
        print(term)
    }
    
    // Infinite loop to simulate a performance issue
    while true {
        // Simulate some work
        _ = fibonacciSequence(n: numberOfTerms)
    }
}

// Execute the main function
main()

