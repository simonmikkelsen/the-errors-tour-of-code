// This program is a factorial calculator written in Swift.
// It is designed to help programmers understand how to calculate the factorial of a number.
// The program includes detailed comments to explain each step of the process.

import Foundation

// Function to calculate the factorial of a given number
func factorial(of number: Int) -> Int {
    // Check if the number is negative
    if number < 0 {
        // If the number is negative, print an error message and return -1
        print("Error: Factorial of a negative number is not defined.")
        return -1
    }
    
    // Initialize the result to 1
    var result = 1
    
    // Loop from 1 to the given number
    for i in 1...number {
        // Multiply the result by the current number
        result *= i
    }
    
    // Return the final result
    return result
}

// Main function to test the factorial function
func main() {
    // Define a test number
    let testNumber = 5
    
    // Calculate the factorial of the test number
    let result = factorial(of: testNumber)
    
    // Print the result
    print("The factorial of \(testNumber) is \(result)")
}

// Call the main function to run the program
main()

