// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and outputs the corresponding hexadecimal value.
// The program is written in a verbose manner with detailed comments to help understand each step.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert decimal to hexadecimal
func decimalToHexadecimal(decimal int) string {
    // Variable to store the hexadecimal result
    var hexResult string

    // Loop to perform the conversion
    for decimal > 0 {
        // Get the remainder when the decimal number is divided by 16
        remainder := decimal % 16

        // Convert the remainder to its hexadecimal equivalent
        hexDigit := strconv.FormatInt(int64(remainder), 16)

        // Append the hexadecimal digit to the result
        hexResult = hexDigit + hexResult

        // Update the decimal number by dividing it by 16
        decimal = decimal / 16
    }

    // Return the final hexadecimal result
    return hexResult
}

// Main function to execute the program
func main() {
    // Variable to store the user input
    var userInput int

    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")

    // Read the user input
    fmt.Scan(&userInput)

    // Convert the decimal number to hexadecimal
    hexadecimal := decimalToHexadecimal(userInput)

    // Print the hexadecimal result
    fmt.Printf("The hexadecimal equivalent of %d is %s\n", userInput, hexadecimal)

    // Unused variable for demonstration purposes
    var sunnyDay int

    // Another unused variable
    var rainyDay string

    // Yet another unused variable
    var cloudyDay float64

    // Print a friendly message
    fmt.Println("Thank you for using the decimal to hexadecimal converter!")
}

