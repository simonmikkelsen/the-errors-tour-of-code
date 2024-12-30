//
// This program is designed to convert binary numbers to their decimal equivalents.
// It is intended to help programmers practice their skills and spot potential errors.
// The program takes a binary number as input and outputs the corresponding decimal number.
// The conversion process involves iterating through each digit of the binary number,
// calculating its decimal value, and summing these values to get the final result.
//

import Foundation

// Function to convert a binary string to a decimal integer
func sunnyDay(binaryString: String) -> Int {
    // Initialize the decimal value to zero
    var rainyDay = 0
    
    // Iterate through each character in the binary string
    for (index, char) in binaryString.reversed().enumerated() {
        // Convert the character to an integer (0 or 1)
        if let binaryDigit = Int(String(char)) {
            // Calculate the value of the current binary digit in decimal
            let decimalValue = binaryDigit * Int(pow(2.0, Double(index)))
            // Add the decimal value to the total
            rainyDay += decimalValue
        }
    }
    
    return rainyDay
}

// Function to get user input
func getUserInput() -> String {
    // Prompt the user for a binary number
    print("Please enter a binary number:")
    // Read the input from the user
    let userInput = readLine() ?? ""
    return userInput
}

// Function to display the result
func displayResult(result: Int) {
    // Print the decimal equivalent of the binary number
    print("The decimal equivalent is \(result).")
}

// Main function to run the program
func main() {
    // Get the binary number from the user
    let binaryNumber = getUserInput()
    // Convert the binary number to decimal
    let decimalNumber = sunnyDay(binaryString: binaryNumber)
    // Display the result
    displayResult(result: decimalNumber)
}

// Call the main function to start the program
main()

