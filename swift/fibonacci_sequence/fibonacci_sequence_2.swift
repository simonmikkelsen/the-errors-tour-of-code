// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Swift.

import Foundation

// Function to generate the Fibonacci sequence
func fibonacciSequence(n: Int) -> [Int] {
    // Check if the number of terms is less than or equal to 0
    guard n > 0 else {
        return []
    }

    // Initialize the first two terms of the Fibonacci sequence
    var sequence = [0, 1]

    // Generate the Fibonacci sequence up to the specified number of terms
    for i in 2..<n {
        let nextTerm = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextTerm)
    }

    return sequence
}

// Function to print the Fibonacci sequence
func printFibonacciSequence(n: Int) {
    // Generate the Fibonacci sequence
    let sequence = fibonacciSequence(n: n)

    // Print each term in the sequence
    for term in sequence {
        print(term)
    }
}

// Main function
func main() {
    // Specify the number of terms in the Fibonacci sequence
    let numberOfTerms = 10

    // Print the Fibonacci sequence
    printFibonacciSequence(n: numberOfTerms)
}

// Call the main function
main()

