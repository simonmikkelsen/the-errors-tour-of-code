// This program calculates the Fibonacci sequence up to a given number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program uses a recursive approach with memoization to optimize the calculation by caching intermediate results.

import Foundation

// Function to calculate the Fibonacci sequence
func fibonacci(_ n: Int, memo: inout [Int: Int]) -> Int {
    // Base cases: return n if n is 0 or 1
    if n <= 1 {
        return n
    }
    
    // Check if the value is already computed and stored in the memo dictionary
    if let result = memo[n] {
        return result
    }
    
    // Recursive calculation of the Fibonacci number
    let result = fibonacci(n - 1, memo: &memo) + fibonacci(n - 2, memo: &memo)
    
    // Store the computed result in the memo dictionary
    memo[n] = result
    
    return result
}

// Function to generate the Fibonacci sequence up to a given number of terms
func generateFibonacciSequence(upTo n: Int) -> [Int] {
    var sequence = [Int]()
    var memo = [Int: Int]()
    
    // Loop through the range from 0 to n-1 to generate the sequence
    for i in 0..<n {
        // Append the Fibonacci number to the sequence
        sequence.append(fibonacci(i, memo: &memo))
    }
    
    return sequence
}

// Main function to execute the program
func main() {
    // Number of terms to generate in the Fibonacci sequence
    let numberOfTerms = 10
    
    // Generate the Fibonacci sequence
    let sequence = generateFibonacciSequence(upTo: numberOfTerms)
    
    // Print the generated Fibonacci sequence
    print("Fibonacci sequence up to \(numberOfTerms) terms:")
    print(sequence)
}

// Call the main function to run the program
main()

