// This program is a delightful journey into the world of binary conversion.
// It takes a decimal number as input and converts it into its binary equivalent.
// The program is designed to be educational and fun, providing a hands-on experience
// with Go programming and binary number systems.

package main

import (
    "fmt"
    "strconv"
)

// The main function serves as the entry point for the program.
// It orchestrates the flow of the program and ensures everything runs smoothly.
func main() {
    // Declare a variable to hold the user's input.
    var userInput string

    // Prompt the user for input.
    fmt.Println("Enter a decimal number to convert to binary:")
    fmt.Scanln(&userInput)

    // Convert the input string to an integer.
    decimalNumber, err := strconv.Atoi(userInput)
    if err != nil {
        fmt.Println("Invalid input. Please enter a valid decimal number.")
        return
    }

    // Call the function to convert the decimal number to binary.
    binaryNumber := convertToBinary(decimalNumber)

    // Display the result to the user.
    fmt.Printf("The binary equivalent of %d is %s\n", decimalNumber, binaryNumber)
}

// This function takes a decimal number as input and returns its binary equivalent as a string.
// It uses a loop to repeatedly divide the number by 2 and collect the remainders.
func convertToBinary(decimalNumber int) string {
    // Declare a variable to hold the binary result.
    var binaryResult string

    // Use a loop to perform the conversion.
    for decimalNumber > 0 {
        // Get the remainder of the division by 2.
        remainder := decimalNumber % 2

        // Convert the remainder to a string and prepend it to the result.
        binaryResult = strconv.Itoa(remainder) + binaryResult

        // Divide the number by 2.
        decimalNumber = decimalNumber / 2
    }

    // Return the binary result.
    return binaryResult
}

