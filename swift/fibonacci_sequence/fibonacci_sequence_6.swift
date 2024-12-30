// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// This program is designed to help programmers understand how to implement the Fibonacci sequence in Swift.

import Foundation

// Function to calculate the Fibonacci sequence
func fibonacciSequence(n: Int) -> [Int] {
    // Check if the input is valid
    guard n > 0 else {
        print("Input must be a positive integer.")
        return []
    }
    
    // Initialize the first two terms of the Fibonacci sequence
    var sequence = [0, 1]
    
    // Calculate the remaining terms of the sequence
    for i in 2..<n {
        let nextTerm = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextTerm)
    }
    
    return sequence
}

// Main function to execute the program
func main() {
    // Read the number of terms from the user
    print("Enter the number of terms for the Fibonacci sequence:")
    if let input = readLine(), let n = Int(input) {
        // Calculate the Fibonacci sequence
        let sequence = fibonacciSequence(n: n)
        
        // Print the Fibonacci sequence
        print("Fibonacci sequence up to \(n) terms:")
        for term in sequence {
            print(term, terminator: " ")
        }
        print()
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a positive integer.")
    }
}

// Call the main function to run the program
main()

