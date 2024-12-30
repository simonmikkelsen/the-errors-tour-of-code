// Prime Number Checker
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It includes detailed comments to help programmers understand the flow and logic of the code.

package main

import (
    "fmt"
    "math"
)

// isPrime function checks if a number is prime
func isPrime(n int) bool {
    // Any number less than 2 is not prime
    if n < 2 {
        return false
    }
    // Check for factors from 2 to the square root of n
    for i := 2; i <= int(math.Sqrt(float64(n))); i++ {
        if n%i == 0 {
            return false
        }
    }
    return true
}

func main() {
    var input int
    fmt.Println("Enter a number to check if it is prime:")
    _, err := fmt.Scan(&input) // Read user input
    if err != nil {
        fmt.Println("Invalid input. Please enter an integer.")
        return
    }

    // Call isPrime function to check if the input number is prime
    if isPrime(input) {
        fmt.Printf("%d is a prime number.\n", input)
    } else {
        fmt.Printf("%d is not a prime number.\n", input)
    }
}

