// This program is a binary to decimal converter written in Swift.
// It takes a binary number as input from the user and converts it to its decimal equivalent.
// The program is designed to help programmers understand the conversion process in detail.
// It includes verbose comments to explain each step of the process.

import Foundation

// Function to convert binary string to decimal integer
func binaryToDecimal(binary: String) -> Int? {
    var decimalValue = 0
    var power = 0
    
    // Iterate over each character in the binary string from right to left
    for char in binary.reversed() {
        if let bit = Int(String(char)) {
            // Calculate the value of the current bit and add it to the decimal value
            decimalValue += bit * Int(pow(2.0, Double(power)))
            power += 1
        } else {
            // Return nil if the binary string contains invalid characters
            return nil
        }
    }
    
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    // Prompt the user to enter a binary number
    print("Enter a binary number:")
    
    // Read the user input from the standard input
    if let input = readLine() {
        return input
    } else {
        return ""
    }
}

// Main function to execute the program
func main() {
    // Get the binary number from the user
    let binaryInput = getUserInput()
    
    // Convert the binary number to decimal
    if let decimalOutput = binaryToDecimal(binary: binaryInput) {
        // Print the decimal equivalent of the binary number
        print("The decimal equivalent of \(binaryInput) is \(decimalOutput).")
    } else {
        // Print an error message if the binary number is invalid
        print("Invalid binary number.")
    }
}

// Execute the main function
main()

