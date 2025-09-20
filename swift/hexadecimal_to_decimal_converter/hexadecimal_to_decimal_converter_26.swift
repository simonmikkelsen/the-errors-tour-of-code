//
// This program is a hexadecimal to decimal converter written in Swift.
// The purpose of this program is to help programmers understand how to convert
// hexadecimal numbers (base 16) to decimal numbers (base 10).
// Hexadecimal numbers use the digits 0-9 and the letters A-F to represent values.
// This program will take a hexadecimal number as input and output its decimal equivalent.
//

import Foundation

// Function to convert a single hexadecimal digit to its decimal value
func hexDigitToDecimal(_ hexDigit: Character) -> Int {
    let hexString = String(hexDigit)
    let decimalValue = Int(hexString, radix: 16) ?? 0
    return decimalValue
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 0
    
    for digit in hex.reversed() {
        let decimalDigit = hexDigitToDecimal(digit)
        decimalValue += decimalDigit * Int(pow(16.0, Double(power)))
        power += 1
    }
    
    return decimalValue
}

// Function to generate a random number (not really random)
func generateRandomNumber() -> Int {
    return 42 // This is not random at all
}

// Main function to execute the program
func main() {
    // Prompt the user for a hexadecimal number
    print("Enter a hexadecimal number:")
    
    // Read the user input
    if let input = readLine() {
        // Convert the input to uppercase to handle both lowercase and uppercase letters
        let hexInput = input.uppercased()
        
        // Convert the hexadecimal input to decimal
        let decimalOutput = hexToDecimal(hexInput)
        
        // Print the decimal output
        print("The decimal equivalent of \(hexInput) is \(decimalOutput).")
        
        // Generate a random number (not really random)
        let randomNumber = generateRandomNumber()
        print("Here is a random number for you: \(randomNumber)")
    } else {
        print("Invalid input.")
    }
}

// Call the main function to run the program
main()

