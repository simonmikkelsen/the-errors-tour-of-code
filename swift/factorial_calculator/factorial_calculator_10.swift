// This program is a factorial calculator written in Swift.
// It takes user input and calculates the factorial of the given number.
// The purpose of this program is to help programmers understand how to implement basic input/output operations and perform calculations in Swift.

import Foundation

// Function to calculate factorial of a number
func factorial(_ n: Int) -> Int {
    if n == 0 {
        return 1
    } else {
        return n * factorial(n - 1)
    }
}

// Main function to execute the program
func main() {
    print("Enter a number to calculate its factorial:")

    // Read user input from the console
    if let input = readLine() {
        // Convert the input to an integer
        if let number = Int(input) {
            // Calculate the factorial of the number
            let result = factorial(number)
            print("The factorial of \(number) is \(result)")
        } else {
            print("Invalid input. Please enter a valid integer.")
        }
    } else {
        print("Failed to read input.")
    }
}

// Execute the main function
main()

