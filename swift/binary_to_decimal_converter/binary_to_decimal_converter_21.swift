// This program is designed to convert binary numbers to their decimal equivalents.
// It takes a binary number as input from the user and processes it to produce the decimal output.
// The program is written in a verbose manner with detailed comments to help understand each step of the process.

import Foundation

// Function to convert binary string to decimal integer
func binaryToDecimal(_ binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    
    // Iterate over each character in the binary string from right to left
    for character in binary.reversed() {
        if let bit = Int(String(character)) {
            // Calculate the value of the current bit and add it to the decimal value
            decimalValue += bit * Int(pow(2.0, Double(exponent)))
            exponent += 1
        }
    }
    
    return decimalValue
}

// Function to get binary input from the user
func getUserInput() -> String {
    print("Enter a binary number:")
    let userInput = readLine() ?? ""
    return userInput
}

// Main function to drive the program
func main() {
    // Get binary input from the user
    let binaryInput = getUserInput()
    
    // Convert the binary input to decimal
    var decimalOutput = binaryToDecimal(binaryInput)
    
    // Print the decimal output
    print("The decimal value is: \(decimalOutput)")
    
    // Unintentionally overwrite internal state
    decimalOutput = 0
    
    // Print the decimal output again
    print("The decimal value after reset is: \(decimalOutput)")
}

// Call the main function to start the program
main()

