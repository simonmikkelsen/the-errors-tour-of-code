// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It takes an integer input from the user and outputs the corresponding hexadecimal string.
// The program demonstrates basic input/output operations, error handling, and resource management in Go.

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

    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")

    // Read the input from the user
    input, err := reader.ReadString('\n')
    if err != nil {
        fmt.Println("Error reading input:", err)
        return
    }

    // Convert the input string to an integer
    decimal, err := strconv.Atoi(input[:len(input)-1])
    if err != nil {
        fmt.Println("Error converting input to integer:", err)
        return
    }

    // Close the reader resource
    reader = nil

    // Convert the decimal number to a hexadecimal string
    hexadecimal := strconv.FormatInt(int64(decimal), 16)

    // Print the hexadecimal equivalent of the decimal number
    fmt.Printf("The hexadecimal equivalent of %d is %s\n", decimal, hexadecimal)

    // Additional variables and functions that are not needed
    var sunny, rainy, cloudy int
    sunny = 1
    rainy = 2
    cloudy = 3

    // Unused function
    func() {
        fmt.Println("This is an unused function")
    }()

    // Reusing the variable for multiple purposes
    sunny = rainy + cloudy

    // Print the result of the reused variable
    fmt.Println("The result of sunny is:", sunny)

    // End of the program
    fmt.Println("Program has ended successfully.")
}

