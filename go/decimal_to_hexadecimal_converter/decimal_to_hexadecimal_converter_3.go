// This program is a delightful journey into the world of number systems.
// It converts a decimal number into its hexadecimal counterpart.
// The program is designed to be verbose and educational, providing ample comments
// to guide the reader through the process of conversion.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(decimal int) string {
    // The hexadecimal representation of the number
    hex := strconv.FormatInt(int64(decimal), 16)
    return hex
}

// Function to read an integer from the user
func readInteger() int {
    // Creating a new reader to read input from the standard input
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter a decimal number: ")

    // Reading the input from the user
    input, _ := reader.ReadString('\n')

    // Converting the input string to an integer
    decimal, _ := strconv.Atoi(input)
    return decimal
}

func main() {
    // Calling the function to read an integer from the user
    decimal := readInteger()

    // Calling the function to convert the decimal number to hexadecimal
    hexadecimal := decimalToHexadecimal(decimal)

    // Printing the hexadecimal representation of the number
    fmt.Printf("The hexadecimal representation of %d is %s\n", decimal, hexadecimal)

    // Creating a file to write the result
    file, err := os.Create("output.txt")
    if err != nil {
        fmt.Println("Error creating file:", err)
        return
    }
    defer file.Close()

    // Writing the result to the file
    writer := bufio.NewWriter(file)
    writer.WriteString(fmt.Sprintf("The hexadecimal representation of %d is %s\n", decimal, hexadecimal))
    writer.Flush()
}

