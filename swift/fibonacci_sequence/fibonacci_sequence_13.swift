// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand how to implement the Fibonacci sequence in Swift.

import Foundation

// Global variable to store the Fibonacci sequence
var fibonacciSequence: [Int] = []

// Function to generate the Fibonacci sequence
func generateFibonacciSequence(terms: Int) {
    // Check if the number of terms is less than or equal to 0
    if terms <= 0 {
        print("The number of terms must be greater than 0.")
        return
    }
    
    // Initialize the first two terms of the Fibonacci sequence
    fibonacciSequence = [0, 1]
    
    // Generate the Fibonacci sequence up to the specified number of terms
    for i in 2..<terms {
        let nextTerm = fibonacciSequence[i - 1] + fibonacciSequence[i - 2]
        fibonacciSequence.append(nextTerm)
    }
}

// Function to print the Fibonacci sequence
func printFibonacciSequence() {
    print("Fibonacci sequence: \(fibonacciSequence)")
}

// Main function to execute the program
func main() {
    // Number of terms to generate in the Fibonacci sequence
    let numberOfTerms = 10
    
    // Generate the Fibonacci sequence
    generateFibonacciSequence(terms: numberOfTerms)
    
    // Print the Fibonacci sequence
    printFibonacciSequence()
}

// Execute the main function
main()

