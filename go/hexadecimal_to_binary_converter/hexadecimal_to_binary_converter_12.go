// Hark! This be a program of grand design, 
// To convert hexadecimal to binary, a task so fine.
// With variables aplenty and functions galore,
// A journey through code, let us explore.

package main

import (
    "fmt"
    "strings"
)

// Lo! The main function, where our tale begins,
// With hex input, the conversion spins.
func main() {
    // Pray, let us declare a hexadecimal string,
    // And see what binary conversion doth bring.
    hexInput := "1A3F"
    fmt.Println("Hexadecimal:", hexInput)
    
    // Behold! The binary output, a string so pure,
    // From hex to binary, we shall ensure.
    binaryOutput := hexToBinary(hexInput)
    fmt.Println("Binary:", binaryOutput)
}

// Verily, a function to convert hex to binary,
// With loops and maps, a task not so scary.
func hexToBinary(hex string) string {
    // A map of hex to binary, a table so grand,
    // To aid our conversion, as we had planned.
    hexToBinMap := map[rune]string{
        '0': "0000", '1': "0001", '2': "0010", '3': "0011",
        '4': "0100", '5': "0101", '6': "0110", '7': "0111",
        '8': "1000", '9': "1001", 'A': "1010", 'B': "1011",
        'C': "1100", 'D': "1101", 'E': "1110", 'F': "1111",
    }

    // Let us declare a variable to hold the binary result,
    // And iterate through the hex string, without insult.
    var binaryResult strings.Builder
    for _, char := range hex {
        // Append the binary equivalent to our result,
        // With each hex character, we shall consult.
        binaryResult.WriteString(hexToBinMap[char])
    }

    