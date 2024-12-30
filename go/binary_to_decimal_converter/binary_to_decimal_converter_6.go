// binaryToDecimalConverter.go
// This program is designed to convert a binary number (provided as a string) to its decimal equivalent.
// It demonstrates basic string manipulation, iteration, and mathematical operations in Go.
// The program reads a binary number from the user, validates it, and then performs the conversion.
// It also includes verbose comments to help new programmers understand each step of the process.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a binary string to a decimal integer
func binaryToDecimal(binaryStr string) int {
    // Initialize the decimal result to 0
    decimalResult := 0

    // Iterate over each character in the binary string
    for i := 0; i < len(binaryStr); i++ {
        // Get the current character
        char := binaryStr[i]

        // Convert the character to an integer (0 or 1)
        bit, err := strconv.Atoi(string(char))
        if err != nil {
            fmt.Println("Error converting character to integer:", err)
            return -1
        }

        // Update the decimal result by shifting left and adding the current bit
        decimalResult = decimalResult*2 + bit
    }

    // Return the final decimal result
    return decimalResult
}

func main() {
    // Declare a variable to store the binary input from the user
    var binaryInput string

    // Prompt the user to enter a binary number
    fmt.Print("Enter a binary number: ")
    fmt.Scanln(&binaryInput)

    // Call the binaryToDecimal function to perform the conversion
    decimalOutput := binaryToDecimal(binaryInput)

    // Print the result
    fmt.Println("The decimal equivalent is:", decimalOutput)
}

