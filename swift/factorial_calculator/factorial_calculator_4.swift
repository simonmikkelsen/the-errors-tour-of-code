// Factorial Calculator in Swift
// This program calculates the factorial of a given number using a recursive function.
// The purpose of this program is to demonstrate the implementation of a factorial calculator in Swift.
// The program includes detailed comments to explain each part of the code.

import Foundation

// Function to calculate the factorial of a number
func factorial(_ n: Int) -> Int {
    // Base case: if n is 0 or 1, return 1
    if n <= 1 {
        return 1
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1)
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

