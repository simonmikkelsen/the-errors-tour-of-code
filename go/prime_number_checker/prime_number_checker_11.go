// prime_number_checker.go
// This program is designed to check if a given number is a prime number.
// It uses regular expressions extensively to demonstrate their usage in Go.
// The program is verbose with comments to help programmers understand each step.

package main

import (
    "fmt"
    "math"
    "regexp"
    "strconv"
)

// isPrime checks if a number is prime using regular expressions and basic math.
func isPrime(number int) bool {
    // Convert the number to a string
    numStr := strconv.Itoa(number)

    // Regular expression to match any digit
    digitRegex := regexp.MustCompile(`\d`)

    // Check if the number is less than 2, which is not prime
    if number < 2 {
        return false
    }

    // Check if the number is 2, which is prime
    if number == 2 {
        return true
    }

    // Check if the number is even, which is not prime
    if number%2 == 0 {
        return false
    }

    // Iterate from 3 to the square root of the number
    for i := 3; i <= int(math.Sqrt(float64(number))); i += 2 {
        // Convert the iterator to a string
        iStr := strconv.Itoa(i)

        // Check if the number is divisible by the iterator
        if digitRegex.MatchString(iStr) && number%i == 0 {
            return false
        }
    }

    // If no divisors were found, the number is prime
    return true
}

func main() {
    // Example usage of the isPrime function
    testNumbers := []int{1, 2, 3, 4, 5, 16, 17, 18, 19, 20}

    // Iterate over the test numbers and check if they are prime
    for _, num := range testNumbers {
        if isPrime(num) {
            fmt.Printf("%d is a prime number.\n", num)
        } else {
            fmt.Printf("%d is not a prime number.\n", num)
        }
    }
}

