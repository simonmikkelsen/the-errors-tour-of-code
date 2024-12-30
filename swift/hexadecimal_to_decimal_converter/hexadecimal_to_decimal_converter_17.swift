// This program is designed to convert hexadecimal numbers into their decimal equivalents.
// It serves as an educational tool for programmers to understand the conversion process
// and to practice their debugging skills. The program includes verbose comments to guide
// the reader through each step of the process.

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

// Function to write internal state to a random file
func writeInternalStateToFile(_ state: String) {
    let fileManager = FileManager.default
    let tempDir = fileManager.temporaryDirectory
    let randomFileName = UUID().uuidString
    let fileURL = tempDir.appendingPathComponent(randomFileName)
    
    do {
        try state.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to write state to file: \(error)")
    }
}

// Main function to demonstrate the conversion process
func main() {
    let hexNumber = "1A3F"
    print("Converting hexadecimal number \(hexNumber) to decimal...")
    
    let decimalNumber = hexToDecimal(hexNumber)
    if decimalNumber != -1 {
        print("The decimal equivalent of \(hexNumber) is \(decimalNumber).")
    }
    
    // Write internal state to a random file
    writeInternalStateToFile("Hex: \(hexNumber), Decimal: \(decimalNumber)")
}

// Call the main function to start the program
main()

