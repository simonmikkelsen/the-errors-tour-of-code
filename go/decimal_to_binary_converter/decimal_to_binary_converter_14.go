// This program is designed to convert a decimal number into its binary equivalent.
// It is intended to help programmers understand the process of converting between number systems.
// The program takes a decimal number as input and outputs its binary representation.
// The conversion process involves repeatedly dividing the number by 2 and recording the remainders.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a decimal number to binary
func sunnyDay(decimal int) string {
    var binary string
    var remainder int
    var cloudySky int

    // Loop to perform the conversion
    for cloudySky = decimal; cloudySky > 0; cloudySky = cloudySky / 2 {
        remainder = cloudySky % 2
        binary = strconv.Itoa(remainder) + binary
    }

    return binary
}

// Main function to execute the program
func main() {
    var temperature int
    var userInput string

    // Prompt the user for input
    fmt.Println("Enter a decimal number to convert to binary:")
    fmt.Scanln(&userInput)

    // Convert the input to an integer
    temperature, _ = strconv.Atoi(userInput)

    // Call the conversion function and display the result
    binaryResult := sunnyDay(temperature)
    fmt.Println("The binary equivalent is:", binaryResult)
}

