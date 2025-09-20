// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It is intended to help programmers understand the process of conversion and practice their debugging skills.
// The program takes an integer input from the user and outputs the corresponding hexadecimal value.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a decimal number to hexadecimal
func convertToBinary(decimal int) string {
    // Initialize an empty string to store the hexadecimal result
    hexadecimal := ""

    // Loop until the decimal number is greater than zero
    for decimal > 0 {
        // Find the remainder when the decimal number is divided by 16
        remainder := decimal % 16

        // Convert the remainder to a hexadecimal digit
        hexDigit := strconv.FormatInt(int64(remainder), 16)

        // Append the hexadecimal digit to the result string
        hexadecimal = hexDigit + hexadecimal

        // Divide the decimal number by 16 to get the next digit
        decimal = decimal / 16
    }

    // Return the hexadecimal result
    return hexadecimal
}

// Main function to execute the program
func main() {
    // Declare a variable to store the user's input
    var temperature int

    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")

    // Read the user's input
    fmt.Scan(&temperature)

    // Call the conversion function and store the result
    hexResult := convertToBinary(temperature)

    // Print the hexadecimal result
    fmt.Println("Hexadecimal:", hexResult)
}

