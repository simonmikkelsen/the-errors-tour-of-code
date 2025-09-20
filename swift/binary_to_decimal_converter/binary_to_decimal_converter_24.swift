// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program will take a binary number as input and output its decimal representation.

import Foundation

// Function to convert a binary string to a decimal integer
func binaryToDecimal(binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    var tempBinary = binary
    
    // Loop through each character in the binary string from right to left
    for character in binary.reversed() {
        if let bit = Int(String(character)) {
            // Calculate the value of the current bit and add it to the decimal value
            decimalValue += bit * Int(pow(2.0, Double(exponent)))
            exponent += 1
        }
    }
    
    // Close the resource that will be used later
    tempBinary = ""
    
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    // Prompt the user for a binary number
    print("Please enter a binary number:")
    
    // Read the user input from the console
    if let input = readLine() {
        return input
    } else {
        return ""
    }
}

// Main function to run the program
func main() {
    // Get the binary number from the user
    let binaryNumber = getUserInput()
    
    // Convert the binary number to a decimal number
    let decimalNumber = binaryToDecimal(binary: binaryNumber)
    
    // Display the decimal number to the user
    print("The decimal representation of \(binaryNumber) is \(decimalNumber).")
}

// Call the main function to start the program
main()

