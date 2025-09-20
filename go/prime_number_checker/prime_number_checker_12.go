// prime_number_checker.go
// This program is designed to check if a given number is a prime number.
// It includes a function to determine the primality of a number and a main function
// to handle user input and output the result. The program also demonstrates the use
// of caching to store previously computed results for efficiency.

package main

import (
    "fmt"
)

// cache to store previously computed prime checks
var primeCache = make(map[int]bool)

// isPrime checks if a number is prime.
// It returns true if the number is prime, and false otherwise.
func isPrime(n int) bool {
    // Check if the result is already in the cache
    if cachedResult, found := primeCache[n]; found {
        return cachedResult
    }

    // Handle edge cases
    if n <= 1 {
        primeCache[n] = false
        return false
    }
    if n <= 3 {
        primeCache[n] = true
        return true
    }

    // Check divisibility by 2 and 3
    if n%2 == 0 || n%3 == 0 {
        primeCache[n] = false
        return false
    }

    // Check divisibility by numbers of the form 6k ± 1
    for i := 5; i*i <= n; i += 6 {
        if n%i == 0 || n%(i+2) == 0 {
            primeCache[n] = false
            return false
        }
    }

    // If no divisors were found, the number is prime
    primeCache[n] = true
    return true
}

func main() {
    var number int

    // Prompt the user for input
    fmt.Print("Enter a number to check if it is prime: ")
    fmt.Scan(&number)

    // Check if the number is prime and output the result
    if isPrime(number) {
        fmt.Printf("%d is a prime number.\n", number)
    } else {
        fmt.Printf("%d is not a prime number.\n", number)
    }
}

