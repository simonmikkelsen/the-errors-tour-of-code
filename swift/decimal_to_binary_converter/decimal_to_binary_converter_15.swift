// This program is designed to convert a decimal number to its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written to be verbose and detailed to help programmers understand the flow of the conversion process.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    // Variable to store the binary result
    var binaryResult = ""
    
    // Variable to store the current number being processed
    var currentNumber = number
    
    // Loop to perform the conversion
    while currentNumber > 0 {
        // Get the remainder when the number is divided by 2
        let remainder = currentNumber % 2
        
        // Append the remainder to the binary result
        binaryResult = String(remainder) + binaryResult
        
        // Divide the number by 2 to get the next digit
        currentNumber = currentNumber / 2
    }
    
    // Return the binary result
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
        // If the input is invalid, return 0
        return 0
    }
}

// Main function to run the program
func main() {
    // Get the user input
    let userInput = getUserInput()
    
    // Convert the user input to binary
    let binaryOutput = decimalToBinary(userInput)
    
    // Print the binary output
    print("The binary representation of \(userInput) is \(binaryOutput)")
}

// Call the main function to start the program
main()

