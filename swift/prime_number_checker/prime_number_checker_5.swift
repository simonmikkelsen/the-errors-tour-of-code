// This program is a prime number checker written in Swift.
// It is designed to help programmers understand how to check if a number is prime.
// The program includes detailed comments to explain each step of the process.

import Foundation

// Function to check if a number is prime
func isPrime(_ num: Int) -> Bool {
    // A prime number is greater than 1
    if num <= 1 {
        return false
    }
    
    // Check for factors from 2 to the square root of the number
    for i in 2...Int(sqrt(Double(num))) {
        // If a factor is found, the number is not prime
        if num % i == 0 {
            return false
        }
    }
    
    // If no factors are found, the number is prime
    return true
}

// Main function to test the isPrime function
func main() {
    // Test numbers
    let testNumbers = [2, 3, 4, 5, 16, 17, 18, 19, 20]
    
    // Check each test number and print the result
    for number in testNumbers {
        if isPrime(number) {
            print("\(number) is a prime number.")
        } else {
            print("\(number) is not a prime number.")
        }
    }
}

// Call the main function to run the program
main()

