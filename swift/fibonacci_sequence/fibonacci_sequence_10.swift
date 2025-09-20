// This program calculates the Fibonacci sequence up to a given number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program will prompt the user to enter the number of terms they want to generate in the sequence.

import Foundation

// Function to generate the Fibonacci sequence
func fibonacci(n: Int) -> [Int] {
    var sequence = [0, 1]
    if n <= 0 {
        return []
    } else if n == 1 {
        return [0]
    } else if n == 2 {
        return sequence
    }
    
    for _ in 2..<n {
        let nextTerm = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextTerm)
    }
    return sequence
}

// Prompt the user to enter the number of terms
print("Enter the number of terms for the Fibonacci sequence:")

// Read user input
if let input = readLine() {
    // Convert the input to an integer
    if let n = Int(input) {
        // Generate the Fibonacci sequence
        let sequence = fibonacci(n: n)
        // Print the sequence
        print("Fibonacci sequence up to \(n) terms:")
        print(sequence)
    } else {
        print("Invalid input. Please enter a valid integer.")
    }
} else {
    print("No input received.")
}

