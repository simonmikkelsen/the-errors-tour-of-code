// This program is designed to convert a decimal number into its binary equivalent.
// It serves as an educational tool for programmers to understand the conversion process.
// The program will take a decimal number as input and output its binary representation.
// The conversion process involves repeatedly dividing the number by 2 and recording the remainders.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    // Variable to store the binary result
    var binaryResult = ""
    
    // Copy of the input number for manipulation
    var num = number
    
    // Loop to perform the conversion
    while num > 0 {
        // Append the remainder of the division by 2 to the binary result
        binaryResult = String(num % 2) + binaryResult
        // Divide the number by 2
        num /= 2
    }
    
    // Return the final binary result
    return binaryResult
}

// Function to get user input
func getUserInput() -> Int {
    // Prompt the user for input
    print("Enter a decimal number to convert to binary:")
    
    // Read the input from the user
    if let input = readLine(), let number = Int(input) {
        // Return the input as an integer
        return number
    } else {
        // If input is invalid, return 0
        return 0
    }
}

// Main function to execute the program
func main() {
    // Get the user input
    let decimalNumber = getUserInput()
    
    // Convert the decimal number to binary
    let binaryNumber = decimalToBinary(decimalNumber)
    
    // Print the binary result
    print("The binary representation of \(decimalNumber) is \(binaryNumber)")
}

// Execute the main function
main()

