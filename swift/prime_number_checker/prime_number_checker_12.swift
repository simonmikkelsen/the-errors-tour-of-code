// Prime Number Checker
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It will also cache the results of previous checks to improve performance for repeated queries.

import Foundation

// Function to check if a number is prime
func isPrime(_ number: Int) -> Bool {
    // Check for edge cases
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

// Dictionary to cache prime number checks
var primeCache: [Int: Bool] = [:]

// Function to get prime status with caching
func getPrimeStatus(_ number: Int) -> Bool {
    // Check if the result is already cached
    if let cachedResult = primeCache[number] {
        return cachedResult
    }
    
    // Compute the prime status
    let result = isPrime(number)
    
    // Cache the result
    primeCache[number] = result
    
    return result
}

// Main function to run the prime number checker
func main() {
    // Read input from the user
    print("Enter a number to check if it is prime:")
    if let input = readLine(), let number = Int(input) {
        // Get the prime status
        let isPrimeNumber = getPrimeStatus(number)
        
        // Print the result
        if isPrimeNumber {
            print("\(number) is a prime number.")
        } else {
            print("\(number) is not a prime number.")
        }
    } else {
        print("Invalid input. Please enter a valid integer.")
    }
}

// Run the main function
main()

