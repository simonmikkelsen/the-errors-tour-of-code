// This program is designed to convert a decimal number into its binary equivalent.
// It takes a decimal number as input and produces a string representing the binary number.
// The program is written in a verbose manner to help new programmers understand each step of the process.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a single digit to binary
func singleDigitToBinary(digit int) string {
    if digit == 0 {
        return "0"
    }
    if digit == 1 {
        return "1"
    }
    return ""
}

// Function to reverse a string
func reverseString(input string) string {
    runes := []rune(input)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}

// Function to convert a decimal number to binary
func decimalToBinary(decimal int) string {
    // Initialize an empty string to store the binary result
    binaryResult := ""
    // Initialize a variable to store the current decimal number
    currentDecimal := decimal

    // Loop until the current decimal number is greater than zero
    for currentDecimal > 0 {
        // Get the remainder when the current decimal number is divided by 2
        remainder := currentDecimal % 2
        // Convert the remainder to a binary digit and add it to the binary result
        binaryResult += singleDigitToBinary(remainder)
        // Update the current decimal number by dividing it by 2
        currentDecimal /= 2
    }

    // Reverse the binary result to get the correct binary representation
    finalBinaryResult := reverseString(binaryResult)
    return finalBinaryResult
}

// Main function to execute the program
func main() {
    // Declare a variable to store the input decimal number
    var inputDecimal int
    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")
    // Read the input decimal number from the user
    fmt.Scan(&inputDecimal)

    // Convert the input decimal number to binary
    binaryResult := decimalToBinary(inputDecimal)

    // Print the binary result
    fmt.Println("Binary equivalent:", binaryResult)
}

