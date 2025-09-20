// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a journey through the enchanting realms of number systems.
// Behold as we transform the mystical hexadecimal digits into their binary counterparts.
// Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function, the grand entry point of our program, where the magic begins.
func main() {
    // Greet the user with a warm welcome message.
    fmt.Println("Welcome to the Hexadecimal to Binary Converter Extravaganza!")

    // Create a reader to capture the user's input from the console.
    reader := bufio.NewReader(os.Stdin)

    // Prompt the user to enter a hexadecimal number.
    fmt.Print("Please enter a hexadecimal number: ")
    hexInput, _ := reader.ReadString('\n')
    hexInput = strings.TrimSpace(hexInput)

    // Call the function to convert the hexadecimal input to binary.
    binaryOutput := convertHexToBinary(hexInput)

    // Display the resulting binary number to the user.
    fmt.Printf("The binary representation of %s is %s\n", hexInput, binaryOutput)
}

// A function that performs the mystical conversion from hexadecimal to binary.
func convertHexToBinary(hex string) string {
    // A map to hold the binary equivalents of hexadecimal digits.
    hexToBinaryMap := map[rune]string{
        '0': "0000", '1': "0001", '2': "0010", '3': "0011",
        '4': "0100", '5': "0101", '6': "0110", '7': "0111",
        '8': "1000", '9': "1001", 'A': "1010", 'B': "1011",
        'C': "1100", 'D': "1101", 'E': "1110", 'F': "1111",
    }

    // Initialize an empty string to accumulate the binary result.
    var binaryResult strings.Builder

    // Iterate over each character in the hexadecimal string.
    for _, char := range hex {
        // Append the corresponding binary value to the result.
        binaryResult.WriteString(hexToBinaryMap[char])
    }

    // Return the final binary