// prime_number_checker.go
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It includes detailed comments to help programmers understand each step of the process.

package main

import (
    "fmt"
)

// isPrime function checks if a number is prime.
// It returns true if the number is prime, and false otherwise.
func isPrime(n int) bool {
    // A number less than or equal to 1 is not a prime number.
    if n <= 1 {
        return false
    }

    // Check for factors from 2 to n-1.
    for i := 2; i < n; i++ {
        // If n is divisible by any number other than 1 and itself, it is not a prime number.
        if n%i == 0 {
            return false
        }
    }

    // If no factors were found, the number is prime.
    return true
}

func main() {
    // Prompt the user to enter a number.
    fmt.Print("Enter a number to check if it is prime: ")

    // Read the input number.
    var num int
    fmt.Scan(&num)

    // Check if the number is prime using the isPrime function.
    if isPrime(num) {
        fmt.Printf("%d is a prime number.\n", num)
    } else {
        fmt.Printf("%d is not a prime number.\n", num)
    }
}

