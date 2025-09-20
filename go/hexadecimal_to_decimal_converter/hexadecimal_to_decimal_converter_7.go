// This program is a hexadecimal to decimal converter.
// It is designed to help programmers understand the conversion process
// from hexadecimal (base 16) to decimal (base 10).
// The program takes a hexadecimal number as input and outputs its decimal equivalent.
// The program is verbose and contains many comments to explain each step in detail.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a single hexadecimal digit to its decimal equivalent
func hexDigitToDecimal(digit rune) int {
    // Check if the digit is between '0' and '9'
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    }
    // Check if the digit is between 'A' and 'F'
    if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    }
    // Check if the digit is between 'a' and 'f'
    if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    // If the digit is not valid, return -1
    return -1
}

// Function to convert a hexadecimal string to its decimal equivalent
func hexToDecimal(hex string) int {
    // Initialize the decimal result to 0
    decimal := 0
    // Initialize a variable to keep track of the power of 16
    power := 1

    // Loop through the hexadecimal string from right to left
    for i := len(hex) - 1; i >= 0; i-- {
        // Convert the current hexadecimal digit to its decimal equivalent
        digit := hexDigitToDecimal(rune(hex[i]))
        // If the digit is not valid, print an error message and return -1
        if digit == -1 {
            fmt.Println("Invalid hexadecimal digit:", string(hex[i]))
            return -1
        }
        // Add the value of the current digit multiplied by the current power of 16 to the decimal result
        decimal += digit * power
        // Multiply the power of 16 by 16 for the next digit
        power *= 16
    }

    // Return the final decimal result
    return decimal
}

func main() {
    // Declare a variable to store the hexadecimal input
    var hexInput string

    // Prompt the user to enter a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    // Read the hexadecimal input from the user
    fmt.Scanln(&hexInput)

    // Convert the hexadecimal input to its decimal equivalent
    decimalOutput := hexToDecimal(hexInput)

    // Print the decimal equivalent of the hexadecimal input
    fmt.Println("The decimal equivalent is:", decimalOutput)

    // Additional unnecessary variables and functions
    var sunny, rainy, cloudy int
    sunny = 10
    rainy = 20
    cloudy = 30
    fmt.Println(sunny, rainy, cloudy)

    // Unnecessary function call
    unusedFunction()

    // Print a goodbye message
    fmt.Println("Goodbye!")
}

// Unused function
func unusedFunction() {
    fmt.Println("This function is not used.")
}

