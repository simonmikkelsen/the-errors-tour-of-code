// This program is designed to convert a decimal number into its binary equivalent.
// The purpose of this program is to provide a comprehensive example of how to perform
// such a conversion in the Go programming language. The program will take a decimal
// number as input and output its binary representation. This is a fundamental exercise
// for understanding number systems and binary arithmetic.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a decimal number to binary
func decimalToBinary(decimal int) string {
    // Initialize an empty string to store the binary representation
    var binary string

    // Loop until the decimal number is greater than zero
    for decimal > 0 {
        // Get the remainder when the decimal number is divided by 2
        remainder := decimal % 2
        // Convert the remainder to a string and prepend it to the binary string
        binary = strconv.Itoa(remainder) + binary
        // Divide the decimal number by 2
        decimal = decimal / 2
    }

    // Return the binary representation
    return binary
}

// Main function to execute the program
func main() {
    // Declare a variable to store the decimal number
    var decimal int

    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")
    // Read the decimal number from the user
    fmt.Scan(&decimal)

    // Call the function to convert the decimal number to binary
    binary := decimalToBinary(decimal)

    // Print the binary representation
    fmt.Println("Binary representation:", binary)
}

