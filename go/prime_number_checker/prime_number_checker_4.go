// prime_number_checker.go
// This program is designed to check if a given number is a prime number.
// It includes detailed comments to help programmers understand the flow and logic of the code.

package main

import (
    "fmt"
)

// isPrime function checks if a number is prime.
// It returns true if the number is prime, otherwise false.
func isPrime(n int) bool {
    // A prime number is greater than 1
    if n <= 1 {
        return false
    }

    // Check for factors from 2 to n-1
    for i := 2; i < n; i++ {
        // If n is divisible by any number other than 1 and itself, it is not prime
        if n%i == 0 {
            return false
        }
    }

    // If no factors were found, n is prime
    return true
}

func main() {
    // Prompt the user to enter a number
    var number int
    fmt.Print("Enter a number to check if it is prime: ")
    fmt.Scan(&number)

    // Check if the entered number is prime
    if isPrime(number) {
        fmt.Printf("%d is a prime number.\n", number)
    } else {
        fmt.Printf("%d is not a prime number.\n", number)
    }

    // Infinite loop to simulate a performance issue
    for {
        // This loop does nothing and runs indefinitely
    }
}

