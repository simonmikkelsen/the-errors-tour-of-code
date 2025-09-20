// This program is designed to convert a binary number (a number expressed in the base-2 numeral system) into its decimal equivalent (a number expressed in the base-10 numeral system).
// The binary numeral system uses only two symbols: typically 0 (zero) and 1 (one). Each digit is referred to as a bit.
// The decimal numeral system, also called base-10, uses ten symbols: 0 through 9.
// This program will take a binary number as input and output its decimal equivalent.

import Foundation

// Function to convert binary string to decimal integer
func binaryToDecimal(binary: String) -> Int {
    // Initialize the decimal value to zero
    var decimalValue: Int = 0
    
    // Initialize the exponent to zero
    var exponent: Int = 0
    
    // Loop through each character in the binary string, starting from the end
    for character in binary.reversed() {
        // Convert the character to an integer (0 or 1)
        if let bit = Int(String(character)) {
            // Calculate the value of the current bit and add it to the decimal value
            decimalValue += bit * Int(pow(2.0, Double(exponent)))
        }
        // Increment the exponent for the next bit
        exponent += 1
    }
    
    // Return the final decimal value
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    // Prompt the user for input
    print("Enter a binary number:")
    
    // Read the input from the user
    if let input = readLine() {
        // Return the input
        return input
    }
    
    // Return an empty string if no input was provided
    return ""
}

// Main function
func main() {
    // Get the binary number from the user
    let binaryNumber = getUserInput()
    
    // Convert the binary number to a decimal number
    let decimalNumber = binaryToDecimal(binary: binaryNumber)
    
    // Print the decimal number
    print("The decimal equivalent of \(binaryNumber) is \(decimalNumber).")
}

// Call the main function to start the program
main()

