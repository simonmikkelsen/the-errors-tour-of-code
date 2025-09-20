// binary_to_decimal_converter.go
// This program is designed to convert a binary number (input as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

// Function to convert a binary string to a decimal number
func binaryToDecimal(binaryString string) (int, error) {
    var decimalNumber int
    var err error
    var temp int

    // Iterate over each character in the binary string
    for i := 0; i < len(binaryString); i++ {
        // Convert the character to an integer (0 or 1)
        temp, err = strconv.Atoi(string(binaryString[i]))
        if err != nil {
            return 0, err
        }

        // Calculate the decimal value by shifting left and adding the current bit
        decimalNumber = decimalNumber*2 + temp
    }

    return decimalNumber, nil
}

func main() {
    // Create a new reader to read input from the standard input (console)
    reader := bufio.NewReader(os.Stdin)

    // Prompt the user to enter a binary number
    fmt.Print("Enter a binary number: ")

    // Read the input from the user
    binaryString, _ := reader.ReadString('\n')

    // Remove the newline character from the input string
    binaryString = binaryString[:len(binaryString)-1]

    // Convert the binary string to a decimal number
    decimalNumber, err := binaryToDecimal(binaryString)
    if err != nil {
        fmt.Println("Error:", err)
        return
    }

    // Print the decimal equivalent of the binary number
    fmt.Println("Decimal equivalent:", decimalNumber)

    // Open a file to write the result (this is where the resource leak occurs)
    file, err := os.Create("result.txt")
    if err != nil {
        fmt.Println("Error creating file:", err)
        return
    }

    // Write the result to the file
    _, err = file.WriteString(fmt.Sprintf("Binary: %s, Decimal: %d\n", binaryString, decimalNumber))
    if err != nil {
        fmt.Println("Error writing to file:", err)
        return
    }

    // Note: The file is not closed, leading to a resource leak
}
