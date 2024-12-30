// This program is designed to convert a binary number (a number expressed in the base-2 numeral system) into its decimal equivalent (a number expressed in the base-10 numeral system).
// The binary numeral system uses only two symbols: typically 0 (zero) and 1 (one). Each digit is referred to as a bit.
// The decimal numeral system, also called base-10, uses ten symbols: 0 through 9. Each digit represents a power of 10.

import Foundation

// Function to convert binary string to decimal integer
func binaryToDecimal(binary: String) -> Int {
    // Initialize the decimal value to zero
    var decimalValue = 0
    // Initialize the power of 2 to zero
    var powerOfTwo = 0
    
    // Iterate over each character in the binary string, starting from the end
    for character in binary.reversed() {
        // Convert the character to an integer (0 or 1)
        if let bit = Int(String(character)) {
            // Calculate the value of the current bit and add it to the decimal value
            decimalValue += bit * Int(pow(2.0, Double(powerOfTwo)))
            // Increment the power of 2 for the next bit
            powerOfTwo += 1
        }
    }
    
    // Return the final decimal value
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    // Prompt the user to enter a binary number
    print("Please enter a binary number:")
    // Read the user input from the console
    let userInput = readLine() ??