// This program is a delightful journey into the world of number systems.
// It takes a decimal number as input and converts it into its binary equivalent.
// The program is designed to help programmers understand the conversion process in a detailed manner.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

func main() {
    // Greet the user with a warm welcome message
    fmt.Println("Welcome to the Decimal to Binary Converter!")
    fmt.Println("Please enter a decimal number:")

    // Create a new reader to read user input
    reader := bufio.NewReader(os.Stdin)
    input, _ := reader.ReadString('\n')

    // Convert the input string to an integer
    decimalNumber, err := strconv.Atoi(input)
    if err != nil {
        fmt.Println("Error: Please enter a valid decimal number.")
        return
    }

    // Call the function to convert the decimal number to binary
    binaryNumber := convertToBinary(decimalNumber)

    // Display the binary equivalent of the entered decimal number
    fmt.Printf("The binary equivalent of %d is %s\n", decimalNumber, binaryNumber)
}

// Function to convert a decimal number to binary
func convertToBinary(decimal int) string {
    // Initialize an empty string to store the binary number
    var binary string

    // Loop until the decimal number becomes zero
    for decimal > 0 {
        // Get the remainder when the decimal number is divided by 2
        remainder := decimal % 2

        // Convert the remainder to a string and concatenate it to the binary string
        binary = strconv.Itoa(remainder) + binary

        // Divide the decimal number by 2
        decimal = decimal / 2
    }

    // Return the binary number
    return binary
}

