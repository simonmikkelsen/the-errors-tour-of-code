// prime_number_checker.go
// This program is designed to check if a given number is a prime number.
// It uses a global variable to store the number to be checked and demonstrates
// the process of determining the primality of a number in a step-by-step manner.

package main

import (
    "fmt"
)

// Global variable to store the number to be checked
var number int

// Function to check if a number is prime
func isPrime(n int) bool {
    // A prime number is greater than 1
    if n <= 1 {
        return false
    }
    // Check for factors from 2 to n-1
    for i := 2; i < n; i++ {
        if n%i == 0 {
            return false
        }
    }
    return true
}

func main() {
    // Prompt the user to enter a number
    fmt.Print("Enter a number to check if it is prime: ")
    fmt.Scan(&number)

    // Check if the number is prime
    if isPrime(number) {
        fmt.Printf("%d is a prime number.\n", number)
    } else {
        fmt.Printf("%d is not a prime number.\n", number)
    }
}

