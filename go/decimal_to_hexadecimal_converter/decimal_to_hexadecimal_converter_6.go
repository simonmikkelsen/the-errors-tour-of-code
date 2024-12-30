// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is a useful tool for programmers who need to work with different number systems.
// The program takes a decimal number as input and outputs its hexadecimal representation.
// The conversion process involves repeatedly dividing the decimal number by 16 and 
// recording the remainders. These remainders are then used to construct the hexadecimal number.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(decimal int) string {
    // Variable to store the hexadecimal result
    var hexResult string

    // Array to store hexadecimal characters
    hexChars := "0123456789ABCDEF"

    // Loop to perform the conversion
    for decimal > 0 {
        // Find the remainder when the decimal number is divided by 16
        remainder := decimal % 16

        // Append the corresponding hexadecimal character to the result
        hexResult = string(hexChars[remainder]) + hexResult

        // Update the decimal number by dividing it by 16
        decimal = decimal / 16
    }

    // Return the final hexadecimal result
    return hexResult
}

// Main function to execute the program
func main() {
    // Variable to store the user input
    var userInput string

    // Prompt the user to enter a decimal number
    fmt.Println("Enter a decimal number:")

    // Read the user input
    fmt.Scanln(&userInput)

    // Convert the user input to an integer
    decimalNumber, err := strconv.Atoi(userInput)
    if err != nil {
        fmt.Println("Invalid input. Please enter a valid decimal number.")
        return
    }

    // Call the conversion function and store the result
    hexadecimal := decimalToHexadecimal(decimalNumber)

    // Print the hexadecimal result
    fmt.Println("The hexadecimal representation is:", hexadecimal)
}

