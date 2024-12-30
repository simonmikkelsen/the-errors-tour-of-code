// temperature_converter.go
// This program is a temperature converter written in Go. 
// It converts temperatures between Celsius, Fahrenheit, and Kelvin.
// The program demonstrates the use of regular expressions for input validation and parsing.
// It is designed to be verbose with comments to help programmers understand each step.

package main

import (
    "fmt"
    "regexp"
    "strconv"
    "strings"
)

// convertCelsiusToFahrenheit converts Celsius to Fahrenheit
func convertCelsiusToFahrenheit(celsius float64) float64 {
    return (celsius * 9 / 5) + 32
}

// convertFahrenheitToCelsius converts Fahrenheit to Celsius
func convertFahrenheitToCelsius(fahrenheit float64) float64 {
    return (fahrenheit - 32) * 5 / 9
}

// convertCelsiusToKelvin converts Celsius to Kelvin
func convertCelsiusToKelvin(celsius float64) float64 {
    return celsius + 273.15
}

// convertKelvinToCelsius converts Kelvin to Celsius
func convertKelvinToCelsius(kelvin float64) float64 {
    return kelvin - 273.15
}

// convertFahrenheitToKelvin converts Fahrenheit to Kelvin
func convertFahrenheitToKelvin(fahrenheit float64) float64 {
    celsius := convertFahrenheitToCelsius(fahrenheit)
    return convertCelsiusToKelvin(celsius)
}

// convertKelvinToFahrenheit converts Kelvin to Fahrenheit
func convertKelvinToFahrenheit(kelvin float64) float64 {
    celsius := convertKelvinToCelsius(kelvin)
    return convertCelsiusToFahrenheit(celsius)
}

// validateAndParseInput validates the input using regular expressions and parses it
func validateAndParseInput(input string) (float64, string, error) {
    // Regular expression to match the input format (e.g., 100C, 212F, 373K)
    re := regexp.MustCompile(`^(\d+)([CFK])$`)
    matches := re.FindStringSubmatch(strings.TrimSpace(input))

    // If the input does not match the expected format, return an error
    if len(matches) != 3 {
        return 0, "", fmt.Errorf("invalid input format")
    }

    // Parse the temperature value
    value, err := strconv.ParseFloat(matches[1], 64)
    if err != nil {
        return 0, "", fmt.Errorf("invalid temperature value")
    }

    // Return the parsed value and the unit
    return value, matches[2], nil
}

func main() {
    // Example input
    input := "100C"

    // Validate and parse the input
    value, unit, err := validateAndParseInput(input)
    if err != nil {
        fmt.Println("Error:", err)
        return
    }

    // Perform the conversion based on the unit
    switch unit {
    case "C":
        fmt.Printf("%.2fC is %.2fF\n", value, convertCelsiusToFahrenheit(value))
        fmt.Printf("%.2fC is %.2fK\n", value, convertCelsiusToKelvin(value))
    case "F":
        fmt.Printf("%.2fF is %.2fC\n", value, convertFahrenheitToCelsius(value))
        fmt.Printf("%.2fF is %.2fK\n", value, convertFahrenheitToKelvin(value))
    case "K":
        fmt.Printf("%.2fK is %.2fC\n", value, convertKelvinToCelsius(value))
        fmt.Printf("%.2fK is %.2fF\n", value, convertKelvinToFahrenheit(value))
    default:
        fmt.Println("Unknown unit")
    }
}

