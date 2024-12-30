//
// Prime Number Checker
//
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It will print a message indicating whether the number is prime or not.
//

import Foundation

// Function to check if a number is prime
func isPrime(_ number: Int) -> Bool {
    // A prime number must be greater than 1
    if number <= 1 {
        return false
    }
    
    // Check divisibility from 2 to the square root of the number
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    
    // If no divisors were found, the number is prime
    return true
}

// Main program execution
print("Enter a number to check if it is prime:")
if let input = readLine(), let number = Int(input) {
    if isPrime(number) {
        print("\(number) is a prime number.")
    } else {
        print("\(number) is not a prime number.")
    }
} else {
    print("Invalid input. Please enter a valid integer.")
}

