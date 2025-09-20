// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Swift.

import Foundation

// Function to generate the Fibonacci sequence
func fibonacciSequence(n: Int) -> [Int] {
    // Check if the input is valid
    guard n > 0 else {
        return []
    }
    
    // Initialize the sequence with the first two numbers
    var sequence = [0, 1]
    
    // Generate the Fibonacci sequence up to the nth term
    for i in 2..<n {
        let nextNumber = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextNumber)
    }
    
    return sequence
}

// Main function to execute the program
func main() {
    // Number of terms to generate in the Fibonacci sequence
    let numberOfTerms = 10
    
    // Generate the Fibonacci sequence
    let sequence = fibonacciSequence(n: numberOfTerms)
    
    // Print the Fibonacci sequence
    print("Fibonacci sequence up to \(numberOfTerms) terms:")
    for num in sequence {
        print(num)
    }
}

// Call the main function to run the program
main()

