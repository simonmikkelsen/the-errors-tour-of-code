// Prime Number Checker
// This program is designed to check if a given number is a prime number.
// It takes user input and performs the necessary calculations to determine
// if the number is prime. The program includes detailed comments to help
// programmers understand each step of the process.

import Foundation

// Function to check if a number is prime
func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    if number <= 3 {
        return true
    }
    if number % 2 == 0 || number % 3 == 0 {
        return false
    }
    var i = 5
    while i * i <= number {
        if number % i == 0 || number % (i + 2) == 0 {
            return false
        }
        i += 6
    }
    return true
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a number to check if it is prime:")
    if let input = readLine() {
        // Convert the input to an integer
        if let number = Int(input) {
            return number
        } else {
            // If the input is not a valid integer, print an error message
            print("Invalid input. Please enter a valid integer.")
            return getUserInput()
        }
    } else {
        // If no input is provided, print an error message
        print("No input provided. Please enter a valid integer.")
        return getUserInput()
    }
}

// Main program execution
let number = getUserInput()

// Check if the number is prime and print the result
if isPrime(number) {
    print("\(number) is a prime number.")
} else {
    print("\(number) is not a prime number.")
}

