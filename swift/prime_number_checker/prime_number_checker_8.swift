// Prime Number Checker
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It includes detailed comments to help programmers understand the logic and flow of the program.

import Foundation

// Function to check if a number is prime
func isPrime(_ number: Int) -> Bool {
    // A number less than 2 is not prime
    if number < 2 {
        return false
    }
    
    // Check for factors from 2 to the square root of the number
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    
    // If no factors are found, the number is prime
    return true
}

// Main function to execute the program
func main() {
    // Prompt the user to enter a number
    print("Enter a number to check if it is prime:")
    
    // Read the user input
    if let input = readLine(), let number = Int(input) {
        // Check if the number is prime
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
}

// Call the main function to run the program
main()

