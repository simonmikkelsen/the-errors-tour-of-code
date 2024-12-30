// This program is designed to convert a binary number (base-2) into a decimal number (base-10).
// It takes a binary string as input and processes each bit to compute the corresponding decimal value.
// The program demonstrates the use of various Swift programming constructs and techniques.

import Foundation

// Function to convert a binary string to a decimal integer
func binaryToDecimal(binary: String) -> Int {
    // Initialize the decimal value to zero
    var decimalValue = 0
    
    // Length of the binary string
    let length = binary.count
    
    // Iterate over each character in the binary string
    for (index, char) in binary.enumerated() {
        // Calculate the power of 2 for the current bit position
        let power = length - index - 1
        
        // Convert the character to an integer (0 or 1)
        if let bit = Int(String(char)) {
            // Add the value of the current bit to the decimal value
            decimalValue += bit * Int(pow(2.0, Double(power)))
        }
    }
    
    // Return the computed decimal value
    return decimalValue
}

// Function to print the result in a friendly manner
func printResult(binary: String, decimal: Int) {
    print("The binary number \(binary) converts to the decimal number \(decimal).")
}

// Main function to execute the program
func main() {
    // Example binary number
    let binaryNumber = "1011"
    
    // Convert the binary number to a decimal number
    let decimalNumber = binaryToDecimal(binary: binaryNumber)
    
    // Print the result
    printResult(binary: binaryNumber, decimal: decimalNumber)
}

// Call the main function to run the program
main()

