// prime_number_checker.go
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It includes detailed comments to help programmers understand the flow and logic of the code.

package main

import (
    "fmt"
)

// isPrime function checks if a number is prime.
// It returns true if the number is prime, and false otherwise.
func isPrime(n int) bool {
    // Any number less than or equal to 1 is not prime.
    if n <= 1 {
        return false
    }
    // Check for factors from 2 to n-1.
    for i := 2; i < n; i++ {
        // If n is divisible by any number other than 1 and itself, it is not prime.
        if n%i == 0 {
            return false
        }
    }
    // If no factors are found, the number is prime.
    return true
}

func main() {
    // Prompt the user to enter a number.
    fmt.Print("Enter a number to check if it is prime: ")
    var num int
    // Read the input number from the user.
    fmt.Scan(&num)

    // Call the isPrime function to check if the number is prime.
    if isPrime(num) {
        // If the number is prime, print a confirmation message.
        fmt.Println(num, "is a prime number.")
    } else {
        // If the number is not prime, print a different message.
        fmt.Println(num, "is not a prime number.")
    }
}

