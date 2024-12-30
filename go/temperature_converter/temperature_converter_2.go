// Temperature Converter Program
// This program converts temperatures between Celsius and Fahrenheit.
// It provides a simple command-line interface for users to input a temperature
// and choose the conversion direction. The program will then output the converted temperature.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
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
    reader := bufio.NewReader(os.Stdin)

    for {
        // Prompt the user to enter a temperature
        fmt.Print("Enter temperature: ")
        input, _ := reader.ReadString('\n')
        input = strings.TrimSpace(input)

        // Convert the input to a float64
        temp, err := strconv.ParseFloat(input, 64)
        if err != nil {
            fmt.Println("Invalid temperature. Please enter a valid number.")
            continue
        }

        // Prompt the user to choose the conversion direction
        fmt.Print("Convert to (C)elsius or (F)ahrenheit? ")
        choice, _ := reader.ReadString('\n')
        choice = strings.TrimSpace(strings.ToUpper(choice))

        // Perform the conversion based on the user's choice
        if choice == "C" {
            fmt.Printf("Temperature in Celsius: %.2f\n", fahrenheitToCelsius(temp))
        } else if choice == "F" {
            fmt.Printf("Temperature in Fahrenheit: %.2f\n", celsiusToFahrenheit(temp))
        } else {
            fmt.Println("Invalid choice. Please enter 'C' or 'F'.")
        }

        // Ask the user if they want to perform another conversion
        fmt.Print("Do you want to convert another temperature? (y/n): ")
        again, _ := reader.ReadString('\n')
        again = strings.TrimSpace(strings.ToLower(again))

        if again != "y" {
            break
        }
    }

    // Memory leak: The reader object is not closed
}