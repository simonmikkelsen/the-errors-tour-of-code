// This Swift program is designed to generate the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program uses regular expressions to validate input and ensure that the number of terms is a positive integer.

import Foundation

// Function to generate the Fibonacci sequence
func fibonacciSequence(terms: Int) -> [Int] {
    // Initialize the first two terms of the Fibonacci sequence
    var sequence = [0, 1]
    
    // Generate the Fibonacci sequence up to the specified number of terms
    for _ in 2..<terms {
        let nextTerm = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextTerm)
    }
    
    return sequence
}

// Function to validate input using regular expressions
func isValidInput(_ input: String) -> Bool {
    // Regular expression to match a positive integer
    let regex = try! NSRegularExpression(pattern: "^[1-9]\\d*$")
    let range = NSRange(location: 0, length: input.utf16.count)
    return regex.firstMatch(in: input, options: [], range: range) != nil
}

// Main program
print("Enter the number of terms for the Fibonacci sequence:")

// Read user input
if let input = readLine() {
    // Validate the input
    if isValidInput(input) {
        // Convert the input to an integer
        if let terms = Int(input) {
            // Generate and print the Fibonacci sequence
            let sequence = fibonacciSequence(terms: terms)
            print("Fibonacci sequence up to \(terms) terms: \(sequence)")
        }
    } else {
        print("Invalid input. Please enter a positive integer.")
    }
} else {
    print("No input received.")
}

