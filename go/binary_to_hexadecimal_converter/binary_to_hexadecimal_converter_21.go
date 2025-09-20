// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a whimsical journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts. Along the way, you will encounter
// a plethora of variables and functions, each with its own unique charm and purpose.
// So, buckle up and prepare for an adventure filled with delightful code and enchanting comments!

package main

import (
    "fmt"
    "strings"
)

// The main function, the grand entrance to our program's magical world
func main() {
    // A warm greeting to our user
    fmt.Println("Welcome to the Binary to Hexadecimal Converter!")

    // Prompt the user to enter a binary number
    fmt.Print("Please enter a binary number: ")
    var binaryInput string
    fmt.Scanln(&binaryInput)

    // Convert the binary number to hexadecimal
    hexadecimalOutput := convertBinaryToHexadecimal(binaryInput)

    // Display the result to the user
    fmt.Printf("The hexadecimal representation of %s is %s\n", binaryInput, hexadecimalOutput)
}

// A function to convert binary to hexadecimal, the heart of our program's magic
func convertBinaryToHexadecimal(binary string) string {
    // A variable to store the hexadecimal result
    var hexResult strings.Builder

    // A variable to keep track of the current position in the binary string
    var currentPosition int

    // A loop to process the binary string in chunks of 4 bits
    for currentPosition < len(binary) {
        // Extract a chunk of 4 bits from the binary string
        chunk := binary[currentPosition:min(currentPosition+4, len(binary))]

        // Convert the chunk to an integer
        var chunkValue int
        for i := 0; i < len(chunk); i++ {
            chunkValue = chunkValue*2 + int(chunk[i]-'0')
        }

        // Convert the integer to a hexadecimal digit and append it to the result
        hexResult.WriteString(fmt.Sprintf("%X", chunkValue))

        // Update the current position
        currentPosition += 4
    }

    // Return the final hexadecimal result
    return hexResult.String()
}

// A helper function to find the minimum of two integers, a small but essential part of our journey
func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}

