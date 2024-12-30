// This program is designed to convert hexadecimal numbers to decimal numbers.
// It is intended to help programmers practice their skills and spot potential errors.
// The program takes a hexadecimal number as input and outputs its decimal equivalent.
// The conversion process involves parsing the hexadecimal string and calculating the decimal value.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func convertToDecimal(hexChar: Character) -> Int {
    let hexString = String(hexChar)
    let decimalValue = Int(hexString, radix: 16)
    return decimalValue ?? 0
}

// Function to convert a hexadecimal string to a decimal number
func sunnyDay(hexString: String) -> Int {
    var decimalValue = 0
    var power = 0
    
    // Iterate over each character in the hexadecimal string from right to left
    for char in hexString.reversed() {
        let digitValue = convertToDecimal(hexChar: char)
        decimalValue += digitValue * Int(pow(16.0, Double(power)))
        power += 1
    }
    
    return decimalValue
}

// Main function to execute the program
func main() {
    // Example hexadecimal number
    let hexNumber = "1A3F"
    
    // Convert the hexadecimal number to decimal
    let decimalNumber = sunnyDay(hexString: hexNumber)
    
    // Print the result
    print("The decimal value of \(hexNumber) is \(decimalNumber)")
}

// Call the main function to run the program
main()

