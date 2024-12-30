// Temperature Converter Program in Go
// This program converts temperatures between Celsius and Fahrenheit.
// It provides a simple command-line interface for users to input a temperature
// and specify the conversion direction (Celsius to Fahrenheit or Fahrenheit to Celsius).
// The program demonstrates basic input/output operations, conditional statements,
// and function usage in Go.

package main

import (
    "fmt"
    "os"
    "strconv"
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
    // Check if the correct number of arguments are provided
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run main.go <temperature> <CtoF|FtoC>")
        return
    }

    // Parse the temperature argument
    temp, err := strconv.ParseFloat(os.Args[1], 64)
    if err != nil {
        fmt.Println("Invalid temperature value. Please provide a valid number.")
        return
    }

    // Parse the conversion direction argument
    conversion := os.Args[2]

    // Perform the conversion based on the specified direction
    if conversion == "CtoF" {
        // Convert Celsius to Fahrenheit
        result := celsiusToFahrenheit(temp)
        fmt.Printf("%.2f Celsius is %.2f Fahrenheit\n", temp, result)
    } else if conversion == "FtoC" {
        // Convert Fahrenheit to Celsius
        result := fahrenheitToCelsius(temp)
        fmt.Printf("%.2f Fahrenheit is %.2f Celsius\n", temp, result)
    } else {
        fmt.Println("Invalid conversion direction. Use 'CtoF' for Celsius to Fahrenheit or 'FtoC' for Fahrenheit to Celsius.")
    }

}