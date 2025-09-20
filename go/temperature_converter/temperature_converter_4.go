// Temperature Converter Program in Go
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides a simple command-line interface for users to input a temperature value
// and specify the conversion direction (Celsius to Fahrenheit or vice versa).
// The program will then output the converted temperature value.

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
    var temp float64
    var choice int

    // Infinite loop to continuously prompt the user for input
    for {
        // Display the menu options to the user
        fmt.Println("Temperature Converter")
        fmt.Println("1. Convert Celsius to Fahrenheit")
        fmt.Println("2. Convert Fahrenheit to Celsius")
        fmt.Println("3. Exit")
        fmt.Print("Enter your choice: ")
        fmt.Scan(&choice)

        // Process the user's choice
        switch choice {
        case 1:
            // Prompt the user to enter the temperature in Celsius
            fmt.Print("Enter temperature in Celsius: ")
            fmt.Scan(&temp)
            // Convert the temperature to Fahrenheit and display the result
            fmt.Printf("Temperature in Fahrenheit: %.2f\n", celsiusToFahrenheit(temp))
        case 2:
            // Prompt the user to enter the temperature in Fahrenheit
            fmt.Print("Enter temperature in Fahrenheit: ")
            fmt.Scan(&temp)
            // Convert the temperature to Celsius and display the result
            fmt.Printf("Temperature in Celsius: %.2f\n", fahrenheitToCelsius(temp))
        case 3:
            // Exit the program
            fmt.Println("Exiting the program.")
            return
        default:
            // Handle invalid menu choices
            fmt.Println("Invalid choice. Please try again.")
        }
    }
}

