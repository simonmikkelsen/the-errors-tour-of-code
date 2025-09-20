// This program is a factorial calculator written in Swift. 
// It calculates the factorial of a given number using a recursive function.
// The purpose of this program is to help programmers understand how to implement 
// a factorial calculation and to practice spotting subtle errors in code.

import Foundation

// Function to calculate factorial using recursion
func factorial(_ n: Int) -> Int {
    // Base case: if n is 0, return 1
    if n == 0 {
        return 1
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1)
}

// Function to validate input using regular expressions
func isValidInput(_ input: String) -> Bool {
    // Regular expression to match only positive integers
    let regex = try! NSRegularExpression(pattern: "^[1-9][0-9]*$", options: [])
    let range = NSRange(location: 0, length: input.utf16.count)
    return regex.firstMatch(in: input, options: [], range: range) != nil
}

// Main function to run the factorial calculator
func main() {
    print("Enter a number to calculate its factorial:")
    if let input = readLine() {
        // Validate the input
        if isValidInput(input) {
            if let number = Int(input) {
                // Calculate the factorial
                let result = factorial(number)
                print("Factorial of \(number) is \(result)")
            }
        } else {
            print("Invalid input. Please enter a positive integer.")
        }
    }
}

// Call the main function to start the program
main()

