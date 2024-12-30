// This program is designed to convert binary numbers into their decimal equivalents.
// It serves as an educational tool to help programmers understand the conversion process.
// The program takes a binary string as input and outputs the corresponding decimal number.

import Foundation

// Function to convert a binary string to a decimal number
func binaryToDecimal(binary: String) -> Int {
    // Initialize the decimal result
    var decimalResult = 0
    // Initialize the exponent value
    var exponent = 0
    
    // Loop through each character in the binary string from right to left
    for char in binary.reversed() {
        // Convert the character to an integer
        if let bit = Int(String(char)) {
            // Calculate the value of the current bit and add it to the result
            decimalResult += bit * Int(pow(2.0, Double(exponent)))
            // Increment the exponent for the next bit
            exponent += 1
        } else {
            // If the character is not a valid binary digit, print an error message
            print("Invalid binary number")
            return -1
        }
    }
    
    // Return the final decimal result
    return decimalResult
}

// Function to get user input
func getUserInput() -> String {
    // Prompt the user for input
    print("Enter a binary number:")
    // Read the input from the console
    let input = readLine() ?? ""
    // Return the input string
    return input
}

// Main function to run the program
func main() {
    // Get the binary input from the user
    let binaryInput = getUserInput()
    // Convert the binary input to a decimal number
    let decimalOutput = binaryToDecimal(binary: binaryInput)
    // Print the decimal output
    print("The decimal equivalent is \(decimalOutput)")
}

// Call the main function to start the program
main()

