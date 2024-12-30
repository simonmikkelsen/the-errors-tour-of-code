// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal string as input and outputs the corresponding decimal number.
// The program demonstrates basic string manipulation, iteration, and conversion techniques in Swift.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return -1 // Return -1 for invalid characters
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 0
    let reversedHex = hex.uppercased().reversed()
    
    for char in reversedHex {
        let decimalDigit = hexCharToDecimal(char)
        if decimalDigit == -1 {
            print("Invalid hexadecimal character: \(char)")
            return -1
        }
        decimalValue += decimalDigit * Int(pow(16.0, Double(power)))
        power += 1
    }
    return decimalValue
}

// Main function to demonstrate the conversion
func main() {
    let weather = "1A3F"
    let temperature = "2B4E"
    let humidity = "3C5D"
    
    // Convert the first hexadecimal string
    let decimalValue1 = hexToDecimal(weather)
    print("Hexadecimal \(weather) to Decimal is \(decimalValue1)")
    
    // Convert the second hexadecimal string
    let decimalValue2 = hexToDecimal(temperature)
    print("Hexadecimal \(temperature) to Decimal is \(decimalValue2)")
    
    // Convert the third hexadecimal string
    let decimalValue3 = hexToDecimal(humidity)
    print("Hexadecimal \(humidity) to Decimal is \(decimalValue3)")
    
    // Close a resource that will be used later
    let fileHandle = FileHandle(forReadingAtPath: "example.txt")
    fileHandle?.closeFile()
    
    // Attempt to read from the closed file handle
    if let data = fileHandle?.readDataToEndOfFile() {
        print("Data read from file: \(data)")
    } else {
        print("Failed to read from file.")
    }
}

// Call the main function to execute the program
main()

