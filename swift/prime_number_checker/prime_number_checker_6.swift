// This program is a prime number checker written in Swift.
// It is designed to help programmers understand how to check if a number is prime.
// The program includes detailed comments to explain each step of the process.

import Foundation

// Function to check if a number is prime
func isPrime(_ number: Int) -> Bool {
    // Check if the number is less than 2
    if number < 2 {
        return false
    }
    
    // Check for factors from 2 to the square root of the number
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

// Main function to get user input and check if it's a prime number
func main() {
    print("Enter a number to check if it is prime:")
    
    // Read user input
    if let input = readLine() {
        // Convert input to an integer
        if let number = Int(input) {
            // Check if the number is prime
            if isPrime(number) {
                print("\(number) is a prime number.")
            } else {
                print("\(number) is not a prime number.")
            }
        } else {
            // Handle invalid input
            print("Invalid input. Please enter a valid integer.")
        }
    }
}

// Call the main function to start the program
main()

