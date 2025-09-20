// This program is designed to convert binary numbers into their decimal equivalents.
// It serves as an educational tool for understanding binary to decimal conversion.
// The program reads a binary number as a string, processes it, and outputs the decimal value.
// The conversion process involves iterating over each bit of the binary number, 
// calculating its positional value, and summing these values to get the final decimal number.

import Foundation

// Function to convert a binary string to a decimal integer
func binaryToDecimal(binary: String) -> Int {
    // Initialize the decimal value to zero
    var decimalValue = 0
    // Initialize the exponent to zero
    var exponent = 0
    
    // Iterate over the binary string from right to left
    for bit in binary.reversed() {
        // Convert the character to an integer
        if let bitValue = Int(String(bit)) {
            // Calculate the positional value and add it to the decimal value
            decimalValue += bitValue * Int(pow(2.0, Double(exponent)))
        }
        // Increment the exponent
        exponent += 1
    }
    
    // Return the final decimal value
    return decimalValue
}

// Function to read a binary number from the user
func readBinaryNumber() -> String {
    // Prompt the user for input
    print("Enter a binary number:")
    // Read the input from the user
    let binary = readLine() ?? ""
    // Return the input
    return binary
}

// Function to display the decimal value
func displayDecimalValue(decimal: Int) {
    // Print the decimal value
    print("The decimal value is \(decimal)")
}

// Main function to coordinate the conversion process
func main() {
    // Read the binary number from the user
    let binary = readBinaryNumber()
    // Convert the binary number to a decimal value
    let decimal = binaryToDecimal(binary: binary)
    // Display the decimal value
    displayDecimalValue(decimal: decimal)
}

// Call the main function to start the program
main()

