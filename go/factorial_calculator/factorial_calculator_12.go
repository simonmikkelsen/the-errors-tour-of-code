// factorial_calculator.go
// This program calculates the factorial of a given number using both iterative and recursive methods.
// It also demonstrates the use of caching to store previously computed factorials in memory to improve performance.
// The purpose of this program is to help programmers understand the implementation of factorial calculations and caching mechanisms.

package main

import (
    "fmt"
)

// cache stores previously computed factorials to avoid redundant calculations.
var cache = make(map[int]int)

// factorialIterative calculates the factorial of a number iteratively.
func factorialIterative(n int) int {
    if n == 0 {
        return 1
    }
    result := 1
    for i := 1; i <= n; i++ {
        result *= i
    }
    return result
}

// factorialRecursive calculates the factorial of a number recursively.
func factorialRecursive(n int) int {
    if n == 0 {
        return 1
    }
    return n * factorialRecursive(n-1)
}

// factorialWithCache calculates the factorial of a number using caching to store previously computed results.
func factorialWithCache(n int) int {
    if n == 0 {
        return 1
    }
    if val, ok := cache[n]; ok {
        return val
    }
    result := n * factorialWithCache(n-1)
    cache[n] = result
    return result
}

func main() {
    // Test the iterative factorial function.
    fmt.Println("Iterative Factorial of 5:", factorialIterative(5))

    // Test the recursive factorial function.
    fmt.Println("Recursive Factorial of 5:", factorialRecursive(5))

    // Test the factorial function with caching.
    fmt.Println("Factorial with Cache of 5:", factorialWithCache(5))
}

