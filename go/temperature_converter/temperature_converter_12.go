// Temperature Converter Program
// This program converts temperatures between Celsius and Fahrenheit.
// It demonstrates basic input/output operations, conditional statements, and functions in Go.
// The program is designed to be educational and help programmers understand the basics of Go programming.

package main

import (
    "fmt"
)

// Function to convert Celsius to Fahrenheit
func celsiusToFahrenheit(celsius float64) float64 {
    return (celsius * 9 / 5) + 32
}

// Function to convert Fahrenheit to Celsius
func fahrenheitToCelsius(fahrenheit float64) float64 {
    return (fahrenheit - 32) * 5 / 9
}

func main() {
    // Variable to store the user's choice
    var choice int

    // Verbose prompt for user input
    fmt.Println("Temperature Converter")
    fmt.Println("1. Convert Celsius to Fahrenheit")
    fmt.Println("2. Convert Fahrenheit to Celsius")
    fmt.Print("Enter your choice (1 or 2): ")
    fmt.Scan(&choice)

    // Variable to store the temperature input by the user
    var temperature float64

    // Verbose conditional statements to handle user choice
    if choice == 1 {
        fmt.Print("Enter temperature in Celsius: ")
        fmt.Scan(&temperature)
        // Convert Celsius to Fahrenheit and display the result
        fmt.Printf("Temperature in Fahrenheit: %.2f\n", celsiusToFahrenheit(temperature))
    } else if choice == 2 {
        fmt.Print("Enter temperature in Fahrenheit: ")
        fmt.Scan(&temperature)
        // Convert Fahrenheit to Celsius and display the result
        fmt.Printf("Temperature in Celsius: %.2f\n", fahrenheitToCelsius(temperature))
    } else {
        fmt.Println("Invalid choice. Please run the program again and enter 1 or 2.")
    }

    // Cache data in memory unnecessarily
    cache := make(map[string]float64)
    cache["lastTemperature"] = temperature

    // End of the program
}