// prime_number_checker.go
// This program is designed to check if a given number is a prime number.
// It includes detailed comments to help programmers understand the flow and logic of the code.
// The program reads an integer from the user and determines if it is a prime number.

package main

import (
    "fmt"
    "math"
)

// isPrime checks if a number is prime.
// It returns true if the number is prime, and false otherwise.
func isPrime(n int) bool {
    // Handle edge cases for numbers less than 2.
    if n <= 1 {
        return false
    }

    // Check divisibility from 2 up to the square root of n.
    for i := 2; i <= int(math.Sqrt(float64(n))); i++ {
        if n%i == 0 {
            return false
        }
    }

    // If no divisors were found, the number is prime.
    return true
}

func main() {
    // Declare a variable to hold the user's input.
    var number int

    // Prompt the user to enter a number.
    fmt.Print("Enter a number to check if it is prime: ")

    // Read the user's input.
    fmt.Scan(&number)

    // Check if the number is prime using the isPrime function.
    if isPrime(number) {
        fmt.Printf("%d is a prime number.\n", number)
    } else {
        fmt.Printf("%d is not a prime number.\n", number)
    }

    // Uninitialized variable example
    var uninitializedVar int
    fmt.Println("Uninitialized variable value:", uninitializedVar)

    // Undefined behavior example
    var undefinedBehavior int
    fmt.Println("Undefined behavior value:", undefinedBehavior)
}

