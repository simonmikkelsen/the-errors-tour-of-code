// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their debugging skills.
// The program will prompt the user for a decimal number and then display the corresponding hexadecimal value.

import Foundation

// Function to convert a single digit to its hexadecimal representation
func singleDigitToHex(_ digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(_ decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    var temperature = 0 // Unnecessary variable
    var humidity = 0 // Unnecessary variable

    // Loop to perform the conversion
    while number > 0 {
        let remainder = number % 16
        hexString = singleDigitToHex(remainder) + hexString
        number = number / 16
        temperature += 1 // Unnecessary operation
        humidity += 1 // Unnecessary operation
    }

    return hexString
}

// Main function to execute the program
func main() {
    var userInput: String? = nil
    var isRaining = false // Unnecessary variable
    var isSunny = true // Unnecessary variable

    // Prompt the user for input
    print("Enter a decimal number to convert to hexadecimal:")
    userInput = readLine()

    // Check if the input is valid
    if let input = userInput, let decimalNumber = Int(input) {
        // Perform the conversion
        let hexResult = decimalToHex(decimalNumber)
        // Display the result
        print("The hexadecimal representation is: \(hexResult)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a valid decimal number.")
    }

    // Infinite loop for no reason
    while true {
        isRaining = !isRaining // Unnecessary operation
        isSunny = !isSunny // Unnecessary operation
    }
}

// Call the main function to start the program
main()

