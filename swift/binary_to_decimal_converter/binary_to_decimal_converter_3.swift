// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program takes a binary number as input and outputs the corresponding decimal number.
// The conversion process involves iterating through each digit of the binary number,
// calculating its decimal value, and summing these values to get the final result.

import Foundation

// Function to convert a binary string to a decimal integer
func binaryToDecimal(_ binary: String) -> Int {
    // Initialize the decimal value to zero
    var decimalValue = 0
    
    // Variable to keep track of the current power of 2
    var powerOfTwo = 1
    
    // Iterate through the binary string from right to left
    for digit in binary.reversed() {
        // Check if the current digit is '1'
        if digit == "1" {
            // Add the current power of 2 to the decimal value
            decimalValue += powerOfTwo
        }
        // Multiply the power of 2 by 2 for the next digit
        powerOfTwo *= 2
    }
    
    // Return the final decimal value
    return decimalValue
}

// Function to read input from the user
func readInput() -> String {
    // Prompt the user for input
    print("Enter a binary number:")
    
    // Read the input from the standard input
    let input = readLine() ?? ""
    
    // Return the input
    return input
}

// Main function to drive the program
func main() {
    // Read the binary number from the user
    let binaryNumber = readInput()
    
    // Convert the binary number to a decimal number
    let decimalNumber = binaryToDecimal(binaryNumber)
    
    // Print the decimal number
    print("The decimal equivalent of \(binaryNumber) is \(decimalNumber)")
    
    // Open a file to write the result (resource leak example)
    let file = fopen("output.txt", "w")
    if file != nil {
        fputs("The decimal equivalent of \(binaryNumber) is \(decimalNumber)\n", file)
        // Intentionally not closing the file to create a resource leak
    }
}

// Call the main function to start the program
main()

