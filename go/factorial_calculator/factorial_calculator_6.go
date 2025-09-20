// factorial_calculator.go
// This program calculates the factorial of a given non-negative integer.
// It is designed to help programmers understand the process of calculating factorials
// and to practice error handling in Go. The program will prompt the user to enter a number
// and then it will compute and display the factorial of that number.

package main

import (
    "fmt"
    "os"
    "strconv"
)

// factorial function calculates the factorial of a given non-negative integer n.
// It returns the factorial value as an int.
func factorial(n int) int {
    if n == 0 {
        return 1
    }
    return n * factorial(n-1)
}

func main() {
    // Prompt the user to enter a number
    fmt.Print("Enter a non-negative integer: ")
    var input string
    fmt.Scanln(&input)

    // Convert the input string to an integer
    number, err := strconv.Atoi(input)
    if err != nil {
        fmt.Println("Invalid input. Please enter a valid non-negative integer.")
        os.Exit(1)
    }

    // Calculate the factorial of the number
    result := factorial(number)

    // Display the result
    fmt.Printf("The factorial of %d is %d\n", number, result)
}

