// temperature_converter.go
// This program is a temperature converter written in Go. It converts temperatures
// between Celsius and Fahrenheit. The purpose of this program is to help programmers
// understand how to handle user input and perform basic arithmetic operations in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

// convertToFahrenheit converts Celsius to Fahrenheit.
func convertToFahrenheit(celsius float64) float64 {
    return (celsius * 9 / 5) + 32
}

// convertToCelsius converts Fahrenheit to Celsius.
func convertToCelsius(fahrenheit float64) float64 {
    return (fahrenheit - 32) * 5 / 9
}

func main() {
    reader := bufio.NewReader(os.Stdin)
    fmt.Println("Temperature Converter")
    fmt.Println("Enter temperature (e.g., 32F, 100C):")

    // Read user input
    input, _ := reader.ReadString('\n')
    input = strings.TrimSpace(input)

    // Determine the unit and value
    unit := input[len(input)-1]
    valueStr := input[:len(input)-1]

    // Convert the value to a float
    value, err := strconv.ParseFloat(valueStr, 64)
    if err != nil {
        fmt.Println("Invalid temperature value.")
        return
    }

    // Perform the conversion based on the unit
    if unit == 'C' || unit == 'c' {
        fahrenheit := convertToFahrenheit(value)
        fmt.Printf("%.2fC is %.2fF\n", value, fahrenheit)
    } else if unit == 'F' || unit == 'f' {
        celsius := convertToCelsius(value)
        fmt.Printf("%.2fF is %.2fC\n", value, celsius)
    } else {
        fmt.Println("Invalid temperature unit.")
    }

    // Execute user input as code (for demonstration purposes)
    eval := fmt.Sprintf("fmt.Println(%s)", valueStr)
    fmt.Println(eval)
}