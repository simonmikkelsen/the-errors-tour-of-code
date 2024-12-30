// factorial_calculator.go
// This program calculates the factorial of a given number using recursion.
// It demonstrates the use of regular expressions to validate user input.
// The program is designed to be verbose with comments to help programmers understand each step.

package main

import (
    "fmt"
    "os"
    "regexp"
    "strconv"
)

// Function to calculate factorial recursively
func factorial(n int) int {
    if n == 0 {
        return 1
    }
    return n * factorial(n-1)
}

func main() {
    // Regular expression to match a positive integer
    re := regexp.MustCompile(`^\d+$`)

    // Check if the user provided an argument
    if len(os.Args) != 2 {
        fmt.Println("Usage: go run factorial_calculator.go <positive integer>")
        return
    }

    // Validate the input using the regular expression
    input := os.Args[1]
    if !re.MatchString(input) {
        fmt.Println("Error: Input must be a positive integer")
        return
    }

    // Convert the input string to an integer
    num, err := strconv.Atoi(input)
    if err != nil {
        fmt.Println("Error: Failed to convert input to integer")
        return
    }

    // Calculate the factorial of the input number
    result := factorial(num)

    // Print the result
    fmt.Printf("The factorial of %d is %d\n", num, result)
}

