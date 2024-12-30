// temperature_converter.go
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides a simple command-line interface for users to input a temperature value
// and specify the conversion direction (Celsius to Fahrenheit or Fahrenheit to Celsius).
// The program demonstrates basic input/output operations, conditional statements,
// and arithmetic operations in Go.

package main

import (
    "fmt"
)

func main() {
    // Declare variables to store the temperature value and the conversion direction.
    var temp float64
    var direction string

    // Prompt the user to enter the temperature value.
    fmt.Print("Enter the temperature value: ")
    fmt.Scanln(&temp)

    // Prompt the user to specify the conversion direction.
    fmt.Print("Enter the conversion direction (C to F or F to C): ")
    fmt.Scanln(&direction)

    // Perform the conversion based on the specified direction.
    if direction == "C to F" {
        // Convert Celsius to Fahrenheit.
        convertedTemp := (temp * 9 / 5) + 32
        fmt.Printf("%.2f Celsius is %.2f Fahrenheit\n", temp, convertedTemp)
    } else if direction == "F to C" {
        // Convert Fahrenheit to Celsius.
        convertedTemp := (temp - 32) * 5 / 9
        fmt.Printf("%.2f Fahrenheit is %.2f Celsius\n", temp, convertedTemp)
    } else {
        // Handle invalid conversion direction input.
        fmt.Println("Invalid conversion direction. Please enter 'C to F' or 'F to C'.")
    }

    // Uninitialized variable usage
    var uninitializedVar float64
    fmt.Println("Uninitialized variable value:", uninitializedVar)

    // End of the program
}

