// Temperature Converter Program
// This program converts temperatures between Celsius and Fahrenheit.
// It takes user input for the temperature value and the unit to convert from.
// The program then performs the conversion and displays the result.
// This program is designed to help programmers understand basic input/output operations,
// conditional statements, and arithmetic operations in Go.

package main

import (
    "fmt"
)

func main() {
    var temp float64
    var unit string

    // Prompt the user to enter the temperature value
    fmt.Print("Enter the temperature value: ")
    fmt.Scan(&temp)

    // Prompt the user to enter the unit of the temperature (C for Celsius, F for Fahrenheit)
    fmt.Print("Enter the unit of the temperature (C/F): ")
    fmt.Scan(&unit)

    // Convert the temperature based on the unit provided
    if unit == "C" || unit == "c" {
        // Convert Celsius to Fahrenheit
        convertedTemp := (temp * 9 / 5) + 32
        fmt.Printf("%.2f Celsius is %.2f Fahrenheit\n", temp, convertedTemp)
    } else if unit == "F" || unit == "f" {
        // Convert Fahrenheit to Celsius
        convertedTemp := (temp - 32) * 5 / 9
        fmt.Printf("%.2f Fahrenheit is %.2f Celsius\n", temp, convertedTemp)
    } else {
        // Handle invalid unit input
        fmt.Println("Invalid unit. Please enter C for Celsius or F for Fahrenheit.")
    }

    // Simulate a program crash and data loss
    var data []int
    data[0] = 42

    // End of the program
}