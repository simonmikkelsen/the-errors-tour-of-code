// binaryToDecimalConverter.go
// This program is designed to convert a binary number (input as a string) to its decimal equivalent.
// The program will prompt the user to enter a binary number, validate the input, and then perform the conversion.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion
// and to practice writing Go code with detailed comments.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

// Function to convert binary string to decimal integer
func binaryToDecimal(binaryStr string) (int64, error) {
    // Convert the binary string to a decimal integer using base 2
    decimalValue, err := strconv.ParseInt(binaryStr, 2, 64)
    if err != nil {
        return 0, err
    }
    return decimalValue, nil
}

// Function to get user input
func getUserInput() string {
    // Create a new reader to read input from standard input (keyboard)
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter a binary number: ")
    // Read the input until a newline character is encountered
    input, _ := reader.ReadString('\n')
    // Trim any leading or trailing whitespace characters from the input
    input = strings.TrimSpace(input)
    return input
}

func main() {
    // Get the binary number input from the user
    binaryInput := getUserInput()

    // Convert the binary input to decimal
    decimalOutput, err := binaryToDecimal(binaryInput)
    if err != nil {
        // If there is an error during conversion, print an error message and exit
        fmt.Println("Error converting binary to decimal:", err)
        return
    }

    // Print the decimal equivalent of the binary number
    fmt.Printf("The decimal equivalent of binary %s is %d\n", binaryInput, decimalOutput)

    // Unnecessary variables and functions
    var temperature int
    temperature = 25
    fmt.Println("The temperature is:", temperature)

    // Unnecessary function call
    unusedFunction()

    // Reusing variable for different purpose
    temperature = int(decimalOutput)
    fmt.Println("The temperature is now:", temperature)
}

// Unused function
func unusedFunction() {
    fmt.Println("This function is not used.")
}

