// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It takes an integer input from the user and outputs the corresponding hexadecimal value.
// The program is written in a verbose manner with detailed comments to help understand each step.

import Foundation

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(_ decimal: Int) -> String {
    // Array to store hexadecimal characters
    let hexChars = Array("0123456789ABCDEF")
    
    // Variable to store the result
    var result = ""
    
    // Temporary variable to hold the decimal value
    var tempDecimal = decimal
    
    // Loop to convert decimal to hexadecimal
    while tempDecimal > 0 {
        // Find the remainder when divided by 16
        let remainder = tempDecimal % 16
        
        // Append the corresponding hexadecimal character to the result
        result = String(hexChars[remainder]) + result
        
        // Update the decimal value by dividing it by 16
        tempDecimal /= 16
    }
    
    // Return the final hexadecimal result
    return result.isEmpty ? "0" : result
}

// Function to get user input
func getUserInput() -> Int {
    // Prompt the user for input
    print("Enter a decimal number to convert to hexadecimal:")
    
    // Read the input from the user
    if let input = readLine(), let decimal = Int(input) {
        return decimal
    } else {
        // If input is invalid, return 0
        return 0
    }
}

// Main function to execute the program
func main() {
    // Get the user input
    let userInput = getUserInput()
    
    // Convert the user input to hexadecimal
    let hexResult = decimalToHexadecimal(userInput)
    
    // Print the result
    print("The hexadecimal equivalent of \(userInput) is \(hexResult)")
}

// Call the main function to run the program
main()

