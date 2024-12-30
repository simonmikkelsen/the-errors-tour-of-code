// This program is a factorial calculator written in Swift.
// It is designed to help programmers understand how to calculate the factorial of a number.
// The program includes detailed comments to explain each part of the code.

import Foundation

// Function to calculate the factorial of a given number
func factorial(of number: Int) -> Int {
    // Base case: if the number is 0, return 1
    if number == 0 {
        return 1
    }
    // Recursive case: multiply the number by the factorial of (number - 1)
    return number * factorial(of: number - 1)
}

// Main function to execute the program
func main() {
    // Prompt the user to enter a number
    print("Enter a number to calculate its factorial:")
    
    // Read the user input
    if let input = readLine(), let number = Int(input) {
        // Calculate the factorial of the entered number
        let result = factorial(of: number)
        
        // Print the result
        print("The factorial of \(number) is \(result)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a valid integer.")
    }
}

// Call the main function to run the program
main()

