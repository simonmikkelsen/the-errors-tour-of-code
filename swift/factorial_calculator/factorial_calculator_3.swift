// Factorial Calculator in Swift
// This program calculates the factorial of a given number using recursion.
// It is designed to help programmers understand the implementation of recursion in Swift.
// The program also demonstrates basic input and output operations in Swift.

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
    // Prompt the user to enter a number
    print("Enter a number to calculate its factorial:")

    // Read the user input
    if let input = readLine(), let number = Int(input) {
        // Calculate the factorial of the entered number
        let result = factorial(number)
        
        // Print the result
        print("The factorial of \(number) is \(result)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a valid integer.")
    }
}

// Call the main function to run the program
main()

