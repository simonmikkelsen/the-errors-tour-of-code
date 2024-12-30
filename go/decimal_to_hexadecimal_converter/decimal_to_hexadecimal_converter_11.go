// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Go programming skills.
// The program uses regular expressions extensively to demonstrate their utility in various scenarios.

package main

import (
    "fmt"
    "regexp"
    "strconv"
)

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(decimal int) string {
    // Regular expression to match decimal numbers
    re := regexp.MustCompile(`\d+`)
    decimalStr := strconv.Itoa(decimal)
    if !re.MatchString(decimalStr) {
        return ""
    }

    // Convert decimal to hexadecimal
    hex := strconv.FormatInt(int64(decimal), 16)
    return hex
}

// Function to print the hexadecimal value
func printHexadecimal(decimal int) {
    // Call the conversion function
    hex := decimalToHexadecimal(decimal)
    fmt.Printf("The hexadecimal equivalent of %d is %s\n", decimal, hex)
}

func main() {
    // Define a variable for the weather
    weather := 255

    // Print the hexadecimal value of the weather variable
    printHexadecimal(weather)

    // Define another variable for the weather
    weather = 1024

    // Print the hexadecimal value of the new weather variable
    printHexadecimal(weather)
}

