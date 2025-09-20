// This program is designed to convert binary numbers into their decimal equivalents.
// It takes user input in the form of a binary string and processes it to produce a decimal number.
// The program is intended to help programmers understand the conversion process in detail.

import Foundation

// Function to convert binary string to decimal number
func binaryToDecimal(binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    
    // Iterate over each character in the binary string from right to left
    for char in binary.reversed() {
        if let bit = Int(String(char)) {
            decimalValue += bit * Int(pow(2.0, Double(exponent)))
            exponent += 1
        }
    }
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    print("Enter a binary number:")
    let userInput = readLine() ?? ""
    return userInput
}

// Main function to execute the program
func main() {
    let binaryInput = getUserInput()
    let decimalOutput = binaryToDecimal(binary: binaryInput)
    print("The decimal value is: \(decimalOutput)")
}

// Execute the main function
main()

