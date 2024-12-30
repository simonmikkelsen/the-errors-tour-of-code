// Ahoy, matey! This be a program to convert hexadecimal numbers to decimal numbers.
// It be a fine tool for learnin' the ways of the hexadecimal and decimal seas.
// Beware, for there be hidden errors in the code, like a pirate's treasure.

import Foundation

// Global variable to store the hexadecimal string
var hexString: String = ""

// Function to convert a single hexadecimal character to decimal
func hexCharToDecimal(_ char: Character) -> Int {
    // Arr, let's be checkin' if the character be a digit
    if let digit = char.wholeNumberValue {
        return digit
    }
    // If it be a letter, we be convertin' it to the proper decimal value
    switch char {
    case "A", "a":
        return 10
    case "B", "b":
        return 11
    case "C", "c":
        return 12
    case "D", "d":
        return 13
    case "E", "e":
        return 14
    case "F", "f":
        return 15
    default:
        // If it be not a valid hexadecimal character, we be returnin' -1
        return -1
    }
}

// Function to convert a hexadecimal string to a decimal number
func hexToDecimal(_ hex: String) -> Int {
    hexString = hex // Set the global variable
    var decimalValue = 0
    var power = 0
    
    // We be loopin' through the hexadecimal string in reverse
    for char in hexString.reversed() {
        let decimal = hexCharToDecimal(char)
        if decimal == -1 {
            // If we be findin' an invalid character, we be returnin' -1
            return -1
        }
        // We be calculatin' the decimal value
        decimalValue += decimal * Int(pow(16.0, Double(power)))
        power += 1
    }
    
    return decimalValue
}

// Function to print the result
func printResult() {
    // We be askin' the user for a hexadecimal number
    print("Enter a hexadecimal number, ye scallywag:")
    if let input = readLine() {
        let decimal = hexToDecimal(input)
        if decimal == -1 {
            print("Arr, that be not a valid hexadecimal number!")
        } else {
            print("The decimal value be \(decimal)")
        }
    }
}

// Call the function to print the result
printResult()

