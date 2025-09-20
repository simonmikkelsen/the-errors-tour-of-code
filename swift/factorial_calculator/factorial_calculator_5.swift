// This program is a factorial calculator written in Swift.
// It is designed to help programmers understand the concept of recursion and how to implement it in Swift.
// The program takes an integer input from the user and calculates the factorial of that number.
// Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

import Foundation

// Function to calculate factorial of a given number
func factorial(of number: Int) -> Int {
    // Base case: if the number is 0 or 1, return 1
    if number <= 1 {
        return 1
    }
    // Recursive case: multiply the number by the factorial of the number minus one
    return number * factorial(of: number - 1)
}

// Function to get user input and calculate factorial
func calculateFactorial() {
    print("Enter a non-negative integer:")
    
    // Read user input
    if let input = readLine(), let number = Int(input), number >= 0 {
        // Calculate factorial
        let result = factorial(of: number)
        // Print the result
        print("Factorial of \(number) is \(result)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a non-negative integer.")
    }
}

// Call the function to start the program
calculateFactorial()

