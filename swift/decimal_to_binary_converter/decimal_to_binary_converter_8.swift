// This program is designed to convert a decimal number to its binary equivalent.
// The purpose of this program is to help programmers understand the process of converting
// decimal numbers to binary numbers through a series of steps and calculations.
// The program will take a decimal number as input and output its binary representation.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    // Initialize an empty string to store the binary representation
    var binaryString = ""
    
    // Variable to hold the current number being processed
    var currentNumber = number
    
    // Loop to perform the conversion
    while currentNumber > 0 {
        // Calculate the remainder when the current number is divided by 2
        let remainder = currentNumber % 2
        
        // Append the remainder to the binary string
        binaryString = String(remainder) + binaryString
        
        // Divide the current number by 2 to get the next number to process
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
        // Return the input as an integer
        return number
    } else {
        // If the input is invalid, return 0
        return 0
    }
}

// Main function to run the program
func main() {
    // Get the user input
    let userInput = getUserInput()
    
    // Convert the user input to binary
    let binaryResult = decimalToBinary(userInput)
    
    // Print the binary result
    print("The binary representation of \(userInput) is \(binaryResult)")
}

// Call the main function to start the program
main()

