// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Swift.

import Foundation

// Function to calculate the Fibonacci sequence
func fibonaciSequence(n: Int) -> [Int] {
    // Check if the number of terms is less than or equal to 0
    guard n > 0 else {
        return []
    }
    
    // Initialize the first two terms of the Fibonacci sequence
    var sequence = [0, 1]
    
    // Loop to calculate the remaining terms of the Fibonacci sequence
    for i in 2..<n {
        // Calculate the next term by adding the two preceding terms
        let nextTerm = sequence[i - 1] + sequence[i - 2]
        // Append the next term to the sequence
        sequence.append(nextTerm)
    }
    
    // Return the calculated Fibonacci sequence
    return sequence
}

// Main function to execute the program
func main() {
    // Define the number of terms for the Fibonacci sequence
    let numberOfTerms = 10
    
    // Call the function to calculate the Fibonacci sequence
    let sequence = fibonaciSequence(n: numberOfTerms)
    
    // Print the calculated Fibonacci sequence
    print("Fibonacci sequence up to \(numberOfTerms) terms:")
    for term in sequence {
        print(term)
    }
}

// Call the main function to run the program
main()

