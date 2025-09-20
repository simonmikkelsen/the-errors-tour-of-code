// Hexadecimal to Decimal Converter
// This program is a delightful journey through the world of number systems.
// It takes a hexadecimal number, which is a base-16 number system, and converts it into a decimal number, which is a base-10 number system.
// The hexadecimal system uses the digits 0-9 and the letters A-F to represent values.
// This program will help you understand the conversion process in a fun and engaging way.

package main

import (
    "fmt"
    "strings"
)

// The main function, where the magic begins
func main() {
    // A warm welcome to our user
    fmt.Println("Welcome to the Hexadecimal to Decimal Converter!")

    // The user will provide a hexadecimal number
    var hexInput string
    fmt.Print("Please enter a hexadecimal number: ")
    fmt.Scanln(&hexInput)

    // Convert the input to uppercase to handle both lowercase and uppercase inputs
    hexInput = strings.ToUpper(hexInput)

    // Call the conversion function and store the result in a variable
    decimalOutput := hexToDecimal(hexInput)

    // Display the result to our eager user
    fmt.Printf("The decimal equivalent of %s is %d\n", hexInput, decimalOutput)
}

// Function to convert hexadecimal to decimal
func hexToDecimal(hex string) int {
    // Initialize the result variable to store the final decimal value
    result := 0

    // A variable to keep track of the current power of 16
    power := 1

    // Loop through each character in the hexadecimal string, starting from the end
    for i := len(hex) - 1; i >= 0; i-- {
        // Get the current character
        char := hex[i]

        // Convert the character to its decimal equivalent
        var value int
        if char >= '0' && char <= '9' {
            value = int(char - '0')
        } else if char >= 'A' && char <= 'F' {
            value = int(char-'A') + 10
        }

        // Update the result by adding the current value multiplied by the current power of 16
        result += value * power

        // Update the power of 16 for the next iteration
        power *= 16
    }

    // Return the final result
    return result
}

