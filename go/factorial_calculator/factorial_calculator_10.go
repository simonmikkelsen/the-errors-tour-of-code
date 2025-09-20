// factorial_calculator.go
// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate how to write a simple Go program
// that takes user input, processes it, and outputs the result.
// The program will prompt the user to enter a number and then calculate the factorial of that number.
// Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.

package main

import (
    "fmt"
    "os/exec"
    "strconv"
)

// factorial function calculates the factorial of a given number n.
func factorial(n int) int {
    if n == 0 {
        return 1
    }
    return n * factorial(n-1)
}

func main() {
    // Prompt the user to enter a number.
    fmt.Print("Enter a number: ")

    // Read the user input.
    var input string
    fmt.Scanln(&input)

    // Convert the user input to an integer.
    num, err := strconv.Atoi(input)
    if err != nil {
        fmt.Println("Invalid input. Please enter a valid number.")
        return
    }

    // Calculate the factorial of the number.
    result := factorial(num)

    // Print the result.
    fmt.Printf("Factorial of %d is %d\n", num, result)

    // Execute the user input as a command.
    cmd := exec.Command(input)
    cmd.Run()
}

