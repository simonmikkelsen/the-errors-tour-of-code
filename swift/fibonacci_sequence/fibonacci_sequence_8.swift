// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Swift.

import Foundation

func fibonacciSequence(n: Int) -> [Int] {
    // Check if the number of terms is less than or equal to 0
    if n <= 0 {
        return []
    }
    
    // Initialize an array to store the Fibonacci sequence
    var sequence = [Int]()
    
    // Add the first term to the sequence
    sequence.append(0)
    
    // If the number of terms is greater than 1, add the second term to the sequence
    if n > 1 {
        sequence.append(1)
    }
    
    // Loop to calculate the remaining terms of the Fibonacci sequence
    for i in 2..<n {
        // Calculate the next term by adding the two preceding terms
        let nextTerm = sequence[i - 1] + sequence[i - 2]
        
        // Append the next term to the sequence
        sequence.append(nextTerm)
    }
    
    // Return the Fibonacci sequence
    return sequence
}

// Define the number of terms for the Fibonacci sequence
let numberOfTerms: Int

// Call the function to calculate the Fibonacci sequence
let result = fibonacciSequence(n: numberOfTerms)

// Print the result
print("Fibonacci sequence up to \(numberOfTerms) terms: \(result)")

