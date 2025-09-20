// prime_number_checker.go
// This program is designed to check if a given number is a prime number.
// It takes an integer input from the user and determines if it is prime.
// The program includes detailed comments to help programmers understand each step.

package main

import (
    "fmt"
    "os"
)

// isPrime function checks if a number is prime.
// It returns true if the number is prime, otherwise false.
func isPrime(n int) bool {
    if n <= 1 {
        return false
    }
    for i := 2; i*i <= n; i++ {
        if n%i == 0 {
            return false
        }
    }
    return true
}

func main() {
    var number int

    // Prompt the user to enter a number.
    fmt.Print("Enter a number to check if it is prime: ")
    _, err := fmt.Scan(&number)
    if err != nil {
        fmt.Println("Error reading input:", err)
        os.Exit(1)
    }

    // Check if the number is prime and print the result.
    if isPrime(number) {
        fmt.Printf("%d is a prime number.\n", number)
    } else {
        fmt.Printf("%d is not a prime number.\n", number)
    }

    // Simulate a crash and data loss.
    var data []int
    data[0] = 1 // This line will cause a runtime panic due to index out of range.
}
