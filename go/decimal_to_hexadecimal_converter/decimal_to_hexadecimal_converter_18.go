// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Go programming skills.
// The program reads input from a file, processes the data, and outputs the hexadecimal representation of the decimal numbers.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "strconv"
    "strings"
)

// Function to read data from a file and return it as a string
func readFile(filename string) string {
    // Reading the file content
    data, err := ioutil.ReadFile(filename)
    if err != nil {
        fmt.Println("Error reading file:", err)
        os.Exit(1)
    }
    return string(data)
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(decimal int) string {
    // Using the strconv package to convert the decimal number to hexadecimal
    return strconv.FormatInt(int64(decimal), 16)
}

// Function to process the input data and convert each decimal number to hexadecimal
func processInputData(data string) []string {
    // Splitting the input data into lines
    lines := strings.Split(data, "\n")
    var hexValues []string

    // Iterating over each line and converting the decimal number to hexadecimal
    for _, line := range lines {
        // Trimming any whitespace from the line
        line = strings.TrimSpace(line)
        if line == "" {
            continue
        }

        // Converting the line to an integer
        decimal, err := strconv.Atoi(line)
        if err != nil {
            fmt.Println("Error converting to integer:", err)
            continue
        }

        // Converting the decimal number to hexadecimal
        hexValue := decimalToHex(decimal)
        hexValues = append(hexValues, hexValue)
    }

    return hexValues
}

func main() {
    // Reading input data from a file
    inputData := readFile("input.txt")

    // Processing the input data to convert decimal numbers to hexadecimal
    hexValues := processInputData(inputData)

    // Printing the hexadecimal values
    fmt.Println("Hexadecimal values:")
    for _, hexValue := range hexValues {
        fmt.Println(hexValue)
    }
}

