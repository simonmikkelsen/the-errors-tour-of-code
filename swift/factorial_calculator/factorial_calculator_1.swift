// This program is a factorial calculator written in Swift.
// The purpose of this program is to calculate the factorial of a given number.
// Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

import Foundation

// Function to calculate factorial of a given number
func factorial(of number: Int) -> Int {
    // Check if the number is negative
    if number < 0 {
        // If the number is negative, factorial is not defined
        print("Factorial is not defined for negative numbers.")
        return -1
    }
    
    // Initialize result to 1
    var result = 1
    
    // Loop from 1 to the given number
    for i in 1...number {
        // Multiply result by the current number
        result *= i
    }
    
    // Return the calculated factorial
    return result
}

// Main function to execute the program
func main() {
    // Define a number to calculate its factorial
    let number = 5
    
    // Calculate the factorial of the defined number
    let result = factorial(of: number)
    
    // Print the result
    print("Factorial of \(number) is \(result)")
}

// Call the main function to run the program
main()

