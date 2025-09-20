// Temperature Converter Program in Go
// This program converts temperatures between Celsius and Fahrenheit.
// It takes user input for the temperature value and the unit to convert from.
// The program then performs the conversion and displays the result.
// Note: This program is designed to be verbose with comments for educational purposes.

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
    // Prompt the user to enter the temperature value
    fmt.Print("Enter the temperature value: ")
    var input string
    fmt.Scanln(&input)

    // Convert the input string to a float64
    temp, err := strconv.ParseFloat(input, 64)
    if err != nil {
        fmt.Println("Invalid temperature value. Please enter a numeric value.")
        os.Exit(1)
    }

    // Prompt the user to enter the unit of the temperature value
    fmt.Print("Enter the unit (C for Celsius, F for Fahrenheit): ")
    var unit string
    fmt.Scanln(&unit)

    // Perform the conversion based on the unit
    if unit == "C" || unit == "c" {
        // Convert Celsius to Fahrenheit
        fahrenheit := celsiusToFahrenheit(temp)
        fmt.Printf("%.2f Celsius is %.2f Fahrenheit\n", temp, fahrenheit)
    } else if unit == "F" || unit == "f" {
        // Convert Fahrenheit to Celsius
        celsius := fahrenheitToCelsius(temp)
        fmt.Printf("%.2f Fahrenheit is %.2f Celsius\n", temp, celsius)
    } else {
        // Handle invalid unit input
        fmt.Println("Invalid unit. Please enter 'C' for Celsius or 'F' for Fahrenheit.")
        os.Exit(1)
    }

    // End of the program
}