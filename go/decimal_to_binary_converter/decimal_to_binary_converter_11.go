// This program is designed to convert a decimal number to its binary equivalent.
// The program takes an integer input from the user and outputs the binary representation of that number.
// It uses regular expressions extensively to demonstrate their usage in Go programming.
// The program is verbose and includes many comments to help understand each step of the process.

package main

import (
    "fmt"
    "regexp"
    "strconv"
)

// Function to convert decimal to binary
func decimalToBinary(decimal int) string {
    // Initialize an empty string to store the binary result
    binary := ""
    
    // Loop until the decimal number is greater than zero
    for decimal > 0 {
        // Get the remainder when the decimal number is divided by 2
        remainder := decimal % 2
        
        // Convert the remainder to a string and prepend it to the binary result
        binary = strconv.Itoa(remainder) + binary
        
        // Divide the decimal number by 2
        decimal = decimal / 2
    }
    
    // Return the binary result
    return binary
}

// Function to validate if the input is a valid decimal number
func validateInput(input string) bool {
    // Regular expression to match a valid decimal number
    re := regexp.MustCompile(`^\d+$`)
    
    // Return true if the input matches the regular expression, false otherwise
    return re.MatchString(input)
}

func main() {
    // Prompt the user to enter a decimal number
    fmt.Println("Enter a decimal number:")
    
    // Read the user input
    var input string
    fmt.Scanln(&input)
    
    // Validate the user input
    if !validateInput(input) {
        // Print an error message if the input is not valid
        fmt.Println("Invalid input. Please enter a valid decimal number.")
        return
    }
    
    // Convert the input string to an integer
    decimal, err := strconv.Atoi(input)
    if err != nil {
        // Print an error message if the conversion fails
        fmt.Println("Error converting input to integer.")
        return
    }
    
    // Convert the decimal number to binary
    binary := decimalToBinary(decimal)
    
    // Print the binary result
    fmt.Println("Binary representation:", binary)
}

