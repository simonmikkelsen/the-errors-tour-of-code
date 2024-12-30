// prime_number_checker.go
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It will print "true" if the number is prime and "false" otherwise.

package main

import (
    "fmt"
)

// isPrime function checks if a number is prime.
// It returns true if the number is prime, and false otherwise.
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
    fmt.Print("Enter a number: ")
    var num int
    fmt.Scan(&num)

    // Call the isPrime function and print the result
    if isPrime(num) {
        fmt.Println("true")
    } else {
        fmt.Println("false")
    }
}

