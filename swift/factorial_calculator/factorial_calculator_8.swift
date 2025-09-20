// This program is a factorial calculator written in Swift.
// It is designed to help programmers understand the implementation of factorial calculation.
// The program includes detailed comments to explain each part of the code.

import Foundation

// Function to calculate the factorial of a given number
func factorial(of number: Int) -> Int {
    // Base case: if the number is 0, the factorial is 1
    if number == 0 {
        return 1
    }
    
    // Recursive case: multiply the number by the factorial of (number - 1)
    return number * factorial(of: number - 1)
}

// Main function to execute the program
func main() {
    // Declare a variable to store the number for which we want to calculate the factorial
    var number: Int
    
    // Print a message to the user
    print("Enter a number to calculate its factorial:")
    
    // Read the input from the user
    if let input = readLine(), let inputNumber = Int(input) {
        number = inputNumber
    }
    
    // Calculate the factorial of the given number
    let result = factorial(of: number)
    
    // Print the result to the user
    print("The factorial of \(number) is \(result)")
}

// Call the main function to run the program
main()

