// This program is a factorial calculator written in Swift.
// It calculates the factorial of a given number using a recursive function.
// The purpose of this program is to demonstrate the use of recursion and global variables in Swift.

import Foundation

// Global variable to store the result of the factorial calculation
var result: Int = 1

// Function to calculate the factorial of a given number
func factorial(_ n: Int) -> Int {
    // Base case: if n is 0 or 1, return 1
    if n <= 1 {
        return 1
    }
    // Recursive case: multiply n by the factorial of (n - 1)
    result = n * factorial(n - 1)
    return result
}

// Main function to execute the program
func main() {
    // Input number for which the factorial is to be calculated
    let number = 5
    
    // Calculate the factorial of the input number
    let factorialResult = factorial(number)
    
    // Print the result
    print("The factorial of \(number) is \(factorialResult)")
}

// Call the main function to run the program
main()

