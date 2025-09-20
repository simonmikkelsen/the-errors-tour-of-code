// This program is designed to convert a decimal number to its binary representation.
// It takes an integer input from the user and processes it to produce the binary equivalent.
// The program is written in Swift and demonstrates basic control flow, loops, and string manipulation.
// The purpose of this program is to provide a comprehensive example of how to perform such a conversion in Swift.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    // Initialize an empty string to store the binary representation
    var binaryString = ""
    
    // Variable to hold the current number being processed
    var currentNumber = number
    
    // Loop to perform the conversion
    while currentNumber > 0 {
        // Get the remainder when the number is divided by 2
        let remainder = currentNumber % 2
        
        // Append the remainder to the binary string
        binaryString = String(remainder) + binaryString
        
        // Update the current number by dividing it by 2
        currentNumber = currentNumber / 2
    }
    
    // Return the binary representation
    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    // Prompt the user for input
    print("Enter a decimal number to convert to binary:")
    
    // Read the input from the user
    if let input = readLine(), let number = Int(input) {
        return number
    } else {
        // If the input is invalid, return 0
        return 0
    }
}

// Main function to execute the program
func main() {
    // Get the user input
    let userInput = getUserInput()
    
    // Convert the user input to binary
    let binaryResult = decimalToBinary(userInput)
    
    // Print the binary result
    print("The binary representation of \(userInput) is \(binaryResult)")
}

// Call the main function to run the program
main()

