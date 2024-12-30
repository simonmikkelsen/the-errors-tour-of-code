// Prime Number Checker
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It includes detailed comments to help understand the logic and flow of the program.

import Foundation

// Function to check if a number is prime
func isPrime(_ number: Int) -> Bool {
    // Any number less than 2 is not prime
    if number < 2 {
        return false
    }
    
    // Check divisibility from 2 to the square root of the number
    for i in 2...number {
        // If the number is divisible by any number other than 1 and itself, it is not prime
        if number % i == 0 {
            return false
        }
    }
    
    // If no divisors were found, the number is prime
    return true
}

// Main program execution starts here
print("Enter a number to check if it is prime:")

// Read user input
if let input = readLine(), let number = Int(input) {
    // Call the isPrime function and store the result
    let result = isPrime(number)
    
    // Print the result
    if result {
        print("\(number) is a prime number.")
    } else {
        print("\(number) is not a prime number.")
    }
} else {
    // Handle invalid input
    print("Invalid input. Please enter a valid integer.")
}

