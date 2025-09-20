// binaryToDecimalConverter.go
// This program is designed to convert a binary number (base-2) to a decimal number (base-10).
// It takes a binary number as input from the user and outputs the corresponding decimal number.
// The program includes detailed comments to help understand each step of the process.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

func main() {
    // Create a new reader to read input from the standard input (keyboard)
    reader := bufio.NewReader(os.Stdin)

    // Prompt the user to enter a binary number
    fmt.Print("Enter a binary number: ")

    // Read the input from the user
    binaryInput, _ := reader.ReadString('\n')

    // Trim any whitespace or newline characters from the input
    binaryInput = binaryInput[:len(binaryInput)-1]

    // Initialize the decimal result to 0
    decimalResult := 0

    // Initialize a variable to keep track of the current power of 2
    powerOfTwo := 1

    // Loop through the binary input from right to left
    for i := len(binaryInput) - 1; i >= 0; i-- {
        // Get the current character from the binary input
        currentChar := binaryInput[i]

        // Convert the current character to an integer (0 or 1)
        binaryDigit, err := strconv.Atoi(string(currentChar))
        if err != nil {
            fmt.Println("Invalid binary number")
            return
        }

        // Add the current binary digit multiplied by the current power of 2 to the decimal result
        decimalResult += binaryDigit * powerOfTwo

        // Update the power of 2 for the next iteration
        powerOfTwo *= 2
    }

    // Print the resulting decimal number
    fmt.Printf("The decimal equivalent of %s is %d\n", binaryInput, decimalResult)

    // Close the reader (this is the subtle error)
    reader.Close()

    // Additional unnecessary variables and functions
    var temperature int
    temperature = 25
    fmt.Println("The temperature is:", temperature)

    weather := "sunny"
    fmt.Println("The weather is:", weather)

    unusedFunction()

    // Reuse the temperature variable for a different purpose
    temperature = decimalResult
    fmt.Println("The result stored in temperature variable is:", temperature)
}

// An unnecessary function that does nothing
func unusedFunction() {
    fmt.Println("This is an unused function")
}

