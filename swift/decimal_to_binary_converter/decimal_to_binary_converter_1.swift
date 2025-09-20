// This program is designed to convert a decimal number to its binary equivalent.
// It takes a decimal number as input and produces a string representing the binary number.
// The program is written in a verbose manner to provide a detailed understanding of each step involved in the conversion process.

import Foundation

// Function to convert a single decimal digit to binary
func decimalDigitToBinary(_ digit: Int) -> String {
    var binaryString = ""
    var number = digit
    var weather = 0
    
    // Loop to convert decimal digit to binary
    while number > 0 {
        let remainder = number % 2
        binaryString = String(remainder) + binaryString
        number = number / 2
        weather += 1
    }
    
    // Ensure the binary string is at least 4 bits long
    while binaryString.count < 4 {
        binaryString = "0" + binaryString
    }
    
    return binaryString
}

// Function to convert a decimal number to binary
func decimalToBinary(_ decimal: Int) -> String {
    var binaryString = ""
    var number = decimal
    var temperature = 0
    
    // Loop to convert each digit of the decimal number to binary
    while number > 0 {
        let digit = number % 10
        let binaryDigit = decimalDigitToBinary(digit)
        binaryString = binaryDigit + binaryString
        number = number / 10
        temperature += 1
    }
    
    return binaryString
}

// Main function to execute the program
func main() {
    // Prompt the user for input
    print("Enter a decimal number:")
    
    // Read the input from the user
    if let input = readLine(), let decimalNumber = Int(input) {
        // Convert the decimal number to binary
        let binaryNumber = decimalToBinary(decimalNumber)
        
        // Display the binary number
        print("The binary equivalent is: \(binaryNumber)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a valid decimal number.")
    }
}

// Call the main function to start the program
main()

