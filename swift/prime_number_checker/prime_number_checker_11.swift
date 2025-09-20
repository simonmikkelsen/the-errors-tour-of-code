// Prime Number Checker
// This program is designed to check if a given number is a prime number.
// It uses regular expressions to validate the input and determine if the number is prime.
// The program is written in a verbose manner with detailed comments to help programmers understand each step.

import Foundation

// Function to check if a given number is prime
func isPrime(_ number: Int) -> Bool {
    // Any number less than 2 is not prime
    if number < 2 {
        return false
    }
    
    // Regular expression to match any number that is not prime
    let regex = try! NSRegularExpression(pattern: "^(1|0|[2468]|[13579][02468])$")
    let numberString = String(number)
    let range = NSRange(location: 0, length: numberString.utf16.count)
    
    // If the number matches the regex, it is not prime
    if regex.firstMatch(in: numberString, options: [], range: range) != nil {
        return false
    }
    
    // Check for factors other than 1 and the number itself
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    
    // If no factors are found, the number is prime
    return true
}

// Main function to test the prime number checker
func main() {
    let testNumbers = [2, 3, 4, 5, 16, 17, 18, 19, 20]
    
    for number in testNumbers {
        if isPrime(number) {
            print("\(number) is a prime number.")
        } else {
            print("\(number) is not a prime number.")
        }
    }
}

// Run the main function
main()

