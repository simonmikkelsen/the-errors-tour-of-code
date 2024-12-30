// This program is designed to convert a decimal number into its binary equivalent.
// The purpose of this program is to help programmers understand the process of converting
// decimal numbers to binary numbers. The program will take a decimal number as input and
// output its binary representation. This is a fundamental concept in computer science
// and is essential for understanding how computers process and store data.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ decimal: Int) -> String {
    // Initialize an empty string to store the binary representation
    var binaryString = ""
    
    // Variable to hold the current decimal value
    var currentDecimal = decimal
    
    // Loop until the current decimal value is greater than zero
    while currentDecimal > 0 {
        // Get the remainder when the current decimal value is divided by 2
        let remainder = currentDecimal % 2
        
        // Append the remainder to the binary string
        binaryString = String(remainder) + binaryString
        
        // Divide the current decimal value by 2
        currentDecimal /= 2
    }
    
    // Return the binary representation
    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    // Prompt the user for input
    print("Enter a decimal number:")
    
    // Read the user input
    if let input = readLine(), let decimal = Int(input) {
        return decimal
    } else {
        // If the input is invalid, return 0
        return 0
    }
}

// Main function
func main() {
    // Get the user input
    let decimal = getUserInput()
    
    // Convert the decimal number to binary
    let binary = decimalToBinary(decimal)
    
    // Print the binary representation
    print("The binary representation of \(decimal) is \(binary)")
    
    // Close the standard input
    fclose(stdin)
    
    // Attempt to read from standard input again
    let anotherDecimal = getUserInput()
    
    // Convert the new decimal number to binary
    let anotherBinary = decimalToBinary(anotherDecimal)
    
    // Print the binary representation of the new decimal number
    print("The binary representation of \(anotherDecimal) is \(anotherBinary)")
}

// Call the main function to start the program
main()

