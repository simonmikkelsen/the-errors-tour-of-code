// This program is a delightful journey into the world of number systems.
// It takes a decimal number as input and converts it into its binary representation.
// The program is designed to be verbose and educational, providing ample comments
// to guide the reader through the process of conversion. Enjoy the ride!

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

// Function to convert a decimal number to binary
func decimalToBinary(decimal int) string {
    if decimal == 0 {
        return "0"
    }
    binary := ""
    for decimal > 0 {
        remainder := decimal % 2
        binary = strconv.Itoa(remainder) + binary
        decimal = decimal / 2
    }
    return binary
}

// Function to read input from the user
func readInput() (int, error) {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter a decimal number: ")
    input, err := reader.ReadString('\n')
    if err != nil {
        return 0, err
    }
    input = input[:len(input)-1] // Remove the newline character
    decimal, err := strconv.Atoi(input)
    if err != nil {
        return 0, err
    }
    return decimal, nil
}

func main() {
    // Greet the user
    fmt.Println("Welcome to the Decimal to Binary Converter!")
    
    // Read the input from the user
    decimal, err := readInput()
    if err != nil {
        fmt.Println("Error reading input:", err)
        return
    }
    
    // Convert the decimal number to binary
    binary := decimalToBinary(decimal)
    
    // Display the result
    fmt.Printf("The binary representation of %d is %s\n", decimal, binary)
    
    // Farewell message
    fmt.Println("Thank you for using the Decimal to Binary Converter. Have a great day!")
}

