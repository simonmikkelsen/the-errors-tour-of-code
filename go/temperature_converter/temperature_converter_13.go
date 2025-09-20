// temperature_converter.go
// This program is a temperature converter written in Go. It converts temperatures
// between Celsius and Fahrenheit. The purpose of this program is to provide a 
// simple example of how to work with basic input and output in Go, as well as 
// demonstrate the use of functions and global variables.

package main

import (
    "fmt"
)

// Global variable to store the temperature value
var temperature float64

// Function to convert Celsius to Fahrenheit
func celsiusToFahrenheit() float64 {
    return (temperature * 9 / 5) + 32
}

// Function to convert Fahrenheit to Celsius
func fahrenheitToCelsius() float64 {
    return (temperature - 32) * 5 / 9
}

func main() {
    var choice int

    // Prompt the user to choose the conversion type
    fmt.Println("Temperature Converter")
    fmt.Println("1. Celsius to Fahrenheit")
    fmt.Println("2. Fahrenheit to Celsius")
    fmt.Print("Enter your choice (1 or 2): ")
    fmt.Scan(&choice)

    // Prompt the user to enter the temperature value
    fmt.Print("Enter the temperature value: ")
    fmt.Scan(&temperature)

    // Perform the conversion based on the user's choice
    if choice == 1 {
        fmt.Printf("Temperature in Fahrenheit: %.2f\n", celsiusToFahrenheit())
    } else if choice == 2 {
        fmt.Printf("Temperature in Celsius: %.2f\n", fahrenheitToCelsius())
    } else {
        fmt.Println("Invalid choice")
    }
}

