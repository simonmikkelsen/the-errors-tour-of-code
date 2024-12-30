// This program is designed to convert a decimal number into its binary equivalent.
// The purpose of this program is to provide a comprehensive example of how to perform
// such a conversion using the Go programming language. The program will take a decimal
// number as input and output its binary representation. This is a fundamental exercise
// for understanding number systems and their conversions, which is crucial for any
// aspiring programmer.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a decimal number to binary
func decimalToBinary(decimal int) string {
    // Initialize an empty string to store the binary result
    var binaryResult string

    // Temporary variable to hold the current decimal value
    currentDecimal := decimal

    // Loop until the current decimal value is greater than zero
    for currentDecimal > 0 {
        // Get the remainder when the current decimal value is divided by 2
        remainder := currentDecimal % 2

        // Convert the remainder to a string and prepend it to the binary result
        binaryResult = strconv.Itoa(remainder) + binaryResult

        // Update the current decimal value by dividing it by 2
        currentDecimal = currentDecimal / 2
    }

    // Return the binary result
    return binaryResult
}

// Main function to execute the program
func main() {
    // Declare a variable to store the user's input
    var userInput int

    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")

    // Read the user's input
    fmt.Scan(&userInput)

    // Call the decimalToBinary function to convert the user's input to binary
    binaryOutput := decimalToBinary(userInput)

    // Print the binary output
    fmt.Println("The binary equivalent is:", binaryOutput)
}

