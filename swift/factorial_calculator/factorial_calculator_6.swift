// This program is a factorial calculator written in Swift.
// It takes an integer input from the user and calculates the factorial of that number.
// The purpose of this program is to help programmers understand the implementation of a factorial function and how to handle user input in Swift.

import Foundation

// Function to calculate factorial of a given number
func factorial(_ n: Int) -> Int {
    // Base case: if n is 0, return 1
    if n == 0 {
        return 1
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1)
}

// Main function to execute the program
func main() {
    // Prompt the user for input
    print("Enter a number to calculate its factorial:")

    // Read the input from the user
    if let input = readLine() {
        // Convert the input to an integer
        if let number = Int(input) {
            // Calculate the factorial using the factorial function
            let result = factorial(number)
            // Print the result
            print("The factorial of \(number) is \(result)")
        } else {
            // Handle the case where the input is not a valid integer
            print("Invalid input. Please enter a valid integer.")
        }
    }
}

// Call the main function to run the program
main()

