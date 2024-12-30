// temperature_converter.go
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides a simple command-line interface for users to input a temperature value
// and specify the conversion direction (Celsius to Fahrenheit or Fahrenheit to Celsius).
// The program will then output the converted temperature value.

package main

import (
    "fmt"
    "os"
    "strconv"
)

// convertCelsiusToFahrenheit converts a temperature from Celsius to Fahrenheit.
func convertCelsiusToFahrenheit(celsius float64) float64 {
    return (celsius * 9 / 5) + 32
}

// convertFahrenheitToCelsius converts a temperature from Fahrenheit to Celsius.
func convertFahrenheitToCelsius(fahrenheit float64) float64 {
    return (fahrenheit - 32) * 5 / 9
}

func main() {
    // Check if the correct number of arguments are provided.
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run temperature_converter.go <temperature> <CtoF|FtoC>")
        return
    }

    // Parse the temperature value from the command-line arguments.
    temp, err := strconv.ParseFloat(os.Args[1], 64)
    if err != nil {
        fmt.Println("Error: Invalid temperature value.")
        return
    }

    // Determine the conversion direction based on the second argument.
    conversionType := os.Args[2]
    var convertedTemp float64

    // Perform the appropriate conversion based on the user's input.
    if conversionType == "CtoF" {
        convertedTemp = convertCelsiusToFahrenheit(temp)
        fmt.Printf("%.2f Celsius is %.2f Fahrenheit\n", temp, convertedTemp)
    } else if conversionType == "FtoC" {
        convertedTemp = convertFahrenheitToCelsius(temp)
        fmt.Printf("%.2f Fahrenheit is %.2f Celsius\n", temp, convertedTemp)
    } else {
        fmt.Println("Error: Invalid conversion type. Use 'CtoF' or 'FtoC'.")
    }

    // End of the program.
}