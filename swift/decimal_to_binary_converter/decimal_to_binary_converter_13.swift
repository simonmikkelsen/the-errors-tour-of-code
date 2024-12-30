//
// Ahoy, matey! This be a program to convert decimal numbers to binary.
// It be a fine tool for learnin' the ways of the binary seas.
// Ye input a decimal number, and the program will give ye the binary equivalent.
// Beware, for the seas be treacherous and full of hidden dangers!
//

import Foundation

// Global variable to store the binary result
var binaryResult: String = ""

// Function to convert decimal to binary
func decimalToBinary(decimal: Int) -> String {
    var decimalNumber = decimal
    var binaryString = ""
    
    // While loop to perform the conversion
    while decimalNumber > 0 {
        let remainder = decimalNumber % 2
        binaryString = String(remainder) + binaryString
        decimalNumber = decimalNumber / 2
    }
    
    // Return the binary string
    return binaryString
}

// Function to print the binary result
func printBinaryResult() {
    print("The binary result be: \(binaryResult)")
}

// Main function to run the program
func main() {
    // Ask the user for a decimal number
    print("Enter a decimal number, ye scallywag:")
    
    // Read the user input
    if let input = readLine(), let decimalNumber = Int(input) {
        // Convert the decimal number to binary
        binaryResult = decimalToBinary(decimal: decimalNumber)
        
        // Print the binary result
        printBinaryResult()
    } else {
        // If the input be invalid, print an error message
        print("Arrr! That not be a valid number!")
    }
}

// Call the main function to start the program
main()

