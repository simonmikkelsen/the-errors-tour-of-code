// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers practice their skills in spotting and fixing errors.
// The program will read hexadecimal numbers from a file and convert them to decimal numbers.
// The program will also demonstrate the use of various Swift programming concepts and techniques.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int? {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return nil
}

// Function to convert a hexadecimal string to a decimal integer
func hexStringToDecimal(_ hex: String) -> Int? {
    var decimalValue = 0
    var multiplier = 1
    for char in hex.uppercased().reversed() {
        if let digitValue = hexCharToDecimal(char) {
            decimalValue += digitValue * multiplier
            multiplier *= 16
        } else {
            return nil
        }
    }
    return decimalValue
}

// Function to read hexadecimal numbers from a file
func readHexNumbersFromFile(_ filePath: String) -> [String]? {
    do {
        let fileContents = try String(contentsOfFile: filePath)
        let hexNumbers = fileContents.components(separatedBy: .newlines)
        return hexNumbers.filter { !$0.isEmpty }
    } catch {
        print("Error reading file: \(error)")
        return nil
    }
}

// Function to convert an array of hexadecimal strings to an array of decimal integers
func convertHexNumbersToDecimals(_ hexNumbers: [String]) -> [Int] {
    var decimalNumbers = [Int]()
    for hex in hexNumbers {
        if let decimal = hexStringToDecimal(hex) {
            decimalNumbers.append(decimal)
        } else {
            print("Invalid hexadecimal number: \(hex)")
        }
    }
    return decimalNumbers
}

// Main function to execute the program
func main() {
    let filePath = "/path/to/hex_numbers.txt"
    if let hexNumbers = readHexNumbersFromFile(filePath) {
        let decimalNumbers = convertHexNumbersToDecimals(hexNumbers)
        print("Decimal numbers: \(decimalNumbers)")
    } else {
        print("Failed to read hexadecimal numbers from file.")
    }
}

// Execute the main function
main()
