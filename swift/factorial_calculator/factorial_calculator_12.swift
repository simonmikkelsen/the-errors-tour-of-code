// Factorial Calculator Program
// This program calculates the factorial of a given number using recursion.
// It also caches the results of previous calculations to improve performance.
// The purpose of this program is to demonstrate the use of recursion, caching, and error spotting in Swift.

import Foundation

// Dictionary to cache previously calculated factorials
var factorialCache: [Int: Int] = [:]

// Function to calculate factorial of a number
func factorial(_ n: Int) -> Int {
    // Base case: factorial of 0 is 1
    if n == 0 {
        return 1
    }
    
    // Check if the result is already cached
    if let cachedResult = factorialCache[n] {
        return cachedResult
    }
    
    // Recursive case: n * factorial of (n-1)
    let result = n * factorial(n - 1)
    
    // Cache the result for future use
    factorialCache[n] = result
    
    return result
}

// Main function to test the factorial calculator
func main() {
    let number = 5
    print("Factorial of \(number) is \(factorial(number))")
}

// Call the main function
main()

