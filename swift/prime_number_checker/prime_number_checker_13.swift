// Prime Number Checker
// This program is designed to check if a given number is a prime number.
// It uses a global variable to store the number to be checked and provides a function to determine if the number is prime.
// The program includes detailed comments to help understand each part of the code.

import Foundation

// Global variable to store the number to be checked
var numberToCheck: Int = 0

// Function to check if a number is prime
func isPrime(_ number: Int) -> Bool {
    // A prime number is greater than 1
    if number <= 1 {
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

// Main function to execute the prime number check
func main() {
    // Assign a value to the global variable
    numberToCheck = 29
    
    // Check if the number is prime and print the result
    if isPrime(numberToCheck) {
        print("\(numberToCheck) is a prime number.")
    } else {
        print("\(numberToCheck) is not a prime number.")
    }
}

// Call the main function to run the program
main()

